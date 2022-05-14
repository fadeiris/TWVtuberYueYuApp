import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/url_set.dart';
import 'package:tw_vtuber_yueyu_app/widgets/card_widget.dart';
import 'package:tw_vtuber_yueyu_app/widgets/link_text.dart';

import 'color_set.dart';

class WidgetSet {
  static const CardWidget cardSocial = CardWidget(
    title: '網路社群',
    leading: Icon(
      Icons.chat,
      color: ColorSet.mainColor,
    ),
    height: 250.0,
    widgets: [
      ListTile(
        title: LinkText(
          url: UrlSet.urlFacebook,
          text: 'Facebook',
        ),
      ),
      ListTile(
        title: LinkText(
          url: UrlSet.urlPlurk,
          text: 'Plurk',
        ),
      ),
      ListTile(
        title: LinkText(
          url: UrlSet.urlDiscord,
          text: 'Discord',
        ),
      ),
    ],
  );

  static const CardWidget cardStreaming = CardWidget(
    title: '影音平台',
    leading: Icon(
      Icons.play_circle,
      color: ColorSet.mainColor,
    ),
    height: 220.0,
    widgets: [
      ListTile(
        title: LinkText(
          url: UrlSet.urlTwitch,
          text: 'Twitch',
        ),
      ),
      ListTile(
        title: LinkText(
          url: UrlSet.urlOdysee,
          text: 'Odysee',
        ),
      ),
    ],
  );

  static const CardWidget cardMisc = CardWidget(
    title: '其他頻道',
    height: 220.0,
    leading: Icon(
      Icons.star,
      color: ColorSet.mainColor,
    ),
    widgets: [
      ListTile(
        title: LinkText(
          url: UrlSet.urlYoutubeYuCatAI,
          text: 'YuCat 語喵 | 叛變跑出去的人工智慧 Q_Q',
        ),
      ),
      ListTile(
        title: LinkText(
          url: UrlSet.urlYoutubeYueyuMagicHut,
          text: '小語の魔法屋 | 魔法貓咪的實驗',
        ),
      ),
    ],
  );

  static const CardWidget cardNFT = CardWidget(
    title: 'NFT',
    height: 160.0,
    leading: Icon(
      Icons.wallet,
      color: ColorSet.mainColor,
    ),
    widgets: [
      ListTile(
        title: LinkText(
          url: UrlSet.urlOpenSea,
          text: 'OpenSea',
        ),
      ),
    ],
  );

  static const CardWidget cardApplication = CardWidget(
    title: 'Android 應用程式',
    height: 160.0,
    leading: Icon(
      Icons.android,
      color: ColorSet.mainColor,
    ),
    widgets: [
      ListTile(
        title: LinkText(
          url: UrlSet.urlApp,
          text: 'Play 商店',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist1 = CardWidget(
    title: '蜧 - Shen lì',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 280.0,
    widgets: [
      ListTile(
        title: Text('☆ 形象繪師 | 歌服繪師 | 動畫師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://twitter.com/gbgbbbb_8',
          text: 'Twitter',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://gbgbbbb.weebly.com',
          text: '首頁',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist2 = CardWidget(
    title: '碰碰ポンポン',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 330.0,
    widgets: [
      ListTile(
        title: Text('☆ LOGO繪師 | 物件繪師 | ED繪師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://twitter.com/tw_ponpon',
          text: 'Twitter',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://www.pixiv.net/users/25049452',
          text: 'Pixiv',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://clibo.tw/users/dKrBN5',
          text: 'Clibo',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist3 = CardWidget(
    title: '霧貓',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 330.0,
    widgets: [
      ListTile(
        title: Text('☆ 表符繪師 | 徽章繪師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://twitter.com/Alcoholic_ism',
          text: 'Twitter',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://clibo.tw/users/dKrBN5',
          text: 'Clibo',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://www.plurk.com/noisiness',
          text: 'Plurk',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist4 = CardWidget(
    title: '哭哭喵',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 280.0,
    widgets: [
      ListTile(
        title: Text('☆ 標誌繪師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://wall.gamer.com.tw/redir.php?userId=onealwdk4168',
          text: '巴哈姆特',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://twitter.com/UCc4vpytctqqKj1',
          text: 'Twitter',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist5 = CardWidget(
    title: '小小玥桐',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 280.0,
    widgets: [
      ListTile(
        title: Text('☆ 插圖繪師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://clibo.tw/users/gT4oB8',
          text: 'Clibo',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'mailto:sky271928@gmail.com',
          text: '信箱',
        ),
      ),
    ],
  );

  static const CardWidget cardArtist6 = CardWidget(
    title: 'Ms_C',
    leading: Icon(
      Icons.draw,
      color: ColorSet.mainColor,
    ),
    height: 280.0,
    widgets: [
      ListTile(
        title: Text('☆ 插圖繪師'),
      ),
      Divider(),
      ListTile(
        title: LinkText(
          url: 'https://clibo.tw/users/MsChartreuxcat',
          text: 'Clibo',
        ),
      ),
      ListTile(
        title: LinkText(
          url: 'https://www.plurk.com/Ms_ChartreuxCat',
          text: 'Plurk',
        ),
      ),
    ],
  );
}
