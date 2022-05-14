import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/color_set.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkText extends StatefulWidget {
  const LinkText({Key? key, required this.url, required this.text})
      : super(key: key);

  final String url, text;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.text,
        style: const TextStyle(
          color: ColorSet.mainColor,
          fontSize: 16,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            bool canLaunch = await canLaunchUrlString(widget.url);

            if (canLaunch) {
              await launchUrlString(
                widget.url,
                mode: LaunchMode.externalApplication,
                webViewConfiguration: const WebViewConfiguration(
                  enableJavaScript: true,
                  enableDomStorage: true,
                ),
              );
            }
          },
      ),
    );
  }
}
