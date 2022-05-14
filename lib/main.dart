import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tw_vtuber_yueyu_app/common/color_set.dart';
import 'package:tw_vtuber_yueyu_app/common/string_set.dart';
import 'package:tw_vtuber_yueyu_app/pages/artist_page.dart';
import 'package:tw_vtuber_yueyu_app/pages/marshmallow_page.dart';
import 'package:tw_vtuber_yueyu_app/pages/misc_page.dart';
import 'package:tw_vtuber_yueyu_app/pages/profcard_page.dart';
import 'package:tw_vtuber_yueyu_app/pages/twitter_page.dart';
import 'package:tw_vtuber_yueyu_app/pages/youtube_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringSet.appName,
      theme: ThemeData(
        primarySwatch: ColorSet.primarySwatch,
      ),
      home: Scaffold(
        body: BottomNavigationController(
          title: StringSet.appName,
        ),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  BottomNavigationControllerState createState() =>
      BottomNavigationControllerState();
}

class BottomNavigationControllerState
    extends State<BottomNavigationController> {
  final PageController _pageViewController = PageController();
  final List<Widget> _pages = [
    const TwitterPage(),
    const MarshmallowPage(),
    const YouTubePage(),
    const MiscPage(),
    const ArtistPage(),
    const ProfcardPage()
  ];
  final int _offlineIndex = 3;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    /// 先檢查網路。
    _checkNetwork();

    return Scaffold(
      appBar: AppBar(
        title: Text(StringSet.pageTitles[_currentIndex]),
        toolbarHeight: (_currentIndex == _offlineIndex || _currentIndex == 4)
            ? kToolbarHeight
            : 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: ColorSet.mainColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.chat,
            ),
            label: StringSet.pageTitles[0],
            tooltip: StringSet.pageTitles[0],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.send,
            ),
            label: StringSet.pageTitles[1],
            tooltip: StringSet.pageTitles[1],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.play_circle,
            ),
            label: StringSet.pageTitles[2],
            tooltip: StringSet.pageTitles[2],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.other_houses,
            ),
            label: StringSet.pageTitles[3],
            tooltip: StringSet.pageTitles[3],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.draw,
            ),
            label: StringSet.pageTitles[4],
            tooltip: StringSet.pageTitles[4],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle,
            ),
            label: StringSet.pageTitles[5],
            tooltip: StringSet.pageTitles[5],
            backgroundColor: ColorSet.barItemBackgroundColor,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onPageChanged(int index) async {
    setState(() {
      _currentIndex = index;
    });

    await _checkNetwork();
  }

  void _onTap(int index) async {
    setState(() {
      _currentIndex = index;
    });

    bool result = await _checkNetwork();

    if (result) {
      _pageViewController.jumpToPage(_currentIndex);
    }
  }

  /// 檢查網路。
  Future<bool> _checkNetwork() async {
    bool result = await _hasNetwork();

    if (!result && _currentIndex != _offlineIndex) {
      _currentIndex = _offlineIndex;

      _pageViewController.jumpToPage(_offlineIndex);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '請確認裝置已連線至網際網路。',
            ),
          ),
        );
      }
    }

    return result;
  }

  /// 判斷是否已連線。
  Future<bool> _hasNetwork() async {
    bool result = false;

    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth) {
      result = true;
    }

    return result;
  }
}
