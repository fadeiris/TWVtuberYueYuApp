import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/url_set.dart';
import 'package:tw_vtuber_yueyu_app/widgets/webview_stack.dart';

class MarshmallowPage extends StatelessWidget {
  const MarshmallowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebViewStack(
      url: UrlSet.urlMarshmallow,
    );
  }
}
