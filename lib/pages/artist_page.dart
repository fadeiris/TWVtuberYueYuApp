import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/widget_set.dart';

class ArtistPage extends StatelessWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              WidgetSet.cardArtist1,
              WidgetSet.cardArtist2,
              WidgetSet.cardArtist3,
              WidgetSet.cardArtist4,
              WidgetSet.cardArtist5,
              WidgetSet.cardArtist6,
            ],
          ),
        ),
      ),
    );
  }
}
