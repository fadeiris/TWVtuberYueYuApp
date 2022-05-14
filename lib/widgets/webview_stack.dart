import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  int loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();

      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      }
    }

    final Completer<WebViewController> controller =
        Completer<WebViewController>();

    JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toaster',
          onMessageReceived: (JavascriptMessage message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          });
    }

    WebView webView = WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      onWebViewCreated: (WebViewController webViewController) {
        controller.complete(webViewController);
      },
      onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      },
      onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      },
      onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      },
    );

    Widget goBackButton() {
      return FutureBuilder<WebViewController>(
        future: controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          return FloatingActionButton(
            tooltip: '返回',
            onPressed: () async {
              bool showErrorMessage = true;

              if (controller.hasData) {
                bool? canGoBack = await controller.data?.canGoBack();

                if (canGoBack != null && canGoBack) {
                  showErrorMessage = false;

                  await controller.data?.goBack();
                }
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
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          webView,
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
}
