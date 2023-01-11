import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WebViewStack extends StatefulWidget {
  const WebViewStack({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  late final WebViewController _controller;
  late final PlatformWebViewController _controllerWeb;

  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      WebViewPlatform.instance = WebWebViewPlatform();

      final PlatformWebViewController controllerWeb = PlatformWebViewController(
        const PlatformWebViewControllerCreationParams(),
      )..loadRequest(
          LoadRequestParams(
            uri: Uri.parse(widget.url),
          ),
        );

      _controllerWeb = controllerWeb;
    } else {
      late final PlatformWebViewControllerCreationParams params;

      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }

      final WebViewController controller =
          WebViewController.fromPlatformCreationParams(params);

      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageStarted: (String url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
            onWebResourceError: (WebResourceError error) {
              String errMsg = '''
                頁面資源錯誤：
                錯誤碼：${error.errorCode}
                描述：${error.description}
                錯誤類玲：${error.errorType}
                是否來自主框架：${error.isForMainFrame}
              ''';

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errMsg)),
              );
            },
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
          ),
        )
        ..addJavaScriptChannel(
          'Toaster',
          onMessageReceived: (JavaScriptMessage message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          },
        )
        ..loadRequest(Uri.parse(widget.url));

      if (controller.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
        (controller.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }

      _controller = controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          kIsWeb
              ? PlatformWebViewWidget(
                  PlatformWebViewWidgetCreationParams(
                      controller: _controllerWeb),
                ).build(context)
              : WebViewWidget(controller: _controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: goBackButton(),
    );
  }

  Widget goBackButton() {
    return FloatingActionButton(
      tooltip: '返回',
      onPressed: () async {
        bool showErrorMessage = true;
        bool canGoBack = await _controller.canGoBack();

        if (canGoBack) {
          showErrorMessage = false;

          await _controller.goBack();
        }

        if (mounted && showErrorMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                '目前無歷史紀錄可以返回。',
              ),
            ),
          );
        }
      },
      child: const Icon(
        Icons.arrow_back,
      ),
    );
  }
}
