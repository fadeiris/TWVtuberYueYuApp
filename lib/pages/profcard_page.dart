import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/url_set.dart';
import 'package:tw_vtuber_yueyu_app/widgets/webview_stack.dart';

class ProfcardPage extends StatelessWidget {
  const ProfcardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebViewStack(
      url: UrlSet.urlProfcard,
    );
  }
}
