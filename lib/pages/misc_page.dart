import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/widget_set.dart';

class MiscPage extends StatelessWidget {
  const MiscPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              WidgetSet.cardSocial,
              WidgetSet.cardStreaming,
              WidgetSet.cardMisc,
              WidgetSet.cardNFT,
              WidgetSet.cardApplication,
            ],
          ),
        ),
      ),
    );
  }
}
