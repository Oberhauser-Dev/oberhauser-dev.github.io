import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oberhauser_dev/components/CardWidget.dart';
import 'package:oberhauser_dev/sites/contact.dart';
import 'package:oberhauser_dev/sites/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

const appTitle = 'Oberhauser Development';

class MyApp extends StatelessWidget {
  static MaterialColor primary = MaterialColor(
    Colors.grey.shade900.value,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(Colors.grey.shade900.value),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        brightness: Brightness.light,
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Quicksand',
        brightness: Brightness.dark,
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.dark,
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> with RestorationMixin {
  final blur = new ImageFilter.blur(sigmaX: 16, sigmaY: 16);
  final RestorableInt _currentIndex = RestorableInt(0);
  final urlPrivateHomepage = 'https://reb0.org';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double maxContainerScreenSize = _calculateContainerSize(screenSize);
    const double appBarHeight = 56;
    var appBar = Container(
      width: screenSize.width,
      child: Center(
        child: Container(
          width: maxContainerScreenSize,
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                  'assets/images/Oberhauser-Dev-simple-sw.svg',
                  color: Colors.white,
                  semanticsLabel: appTitle),
              padding: EdgeInsets.all(12),
            ),
            Expanded(
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: appTitle.toUpperCase(),
                  ),
                  Tab(text: 'Projects'.toUpperCase()),
                  Tab(text: 'Contact'.toUpperCase()),
                ],
              ),
            ),
            IconButton(
                color: Colors.white,
                padding: EdgeInsets.only(right: 20),
                onPressed: () => canLaunch(urlPrivateHomepage)
                    .then((value) => launch(urlPrivateHomepage)),
                tooltip: 'Private Homepage',
                icon: Icon(Icons.face)),
          ]

              // PopupMenuButton(
              //   itemBuilder: (context) => <PopupMenuEntry<String>>[
              //     PopupMenuItem<String>(
              //         value: 'Share',
              //         child: ListTile(
              //             leading: Icon(Icons.share), title: Text('Share'))),
              //     PopupMenuDivider(),
              //   ],
              //   padding: EdgeInsets.zero,
              //   onSelected: (value) => print(value),
              // )
              ),
        ),
      ),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: Container(
              color: Colors.black45,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: blur,
                  child: appBar,
                ),
              ),
            ),
            preferredSize:
                Size(MediaQuery.of(context).size.width, appBarHeight),
          ),
          body: Stack(children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.brown.shade50, BlendMode.color),
                image: AssetImage('assets/images/Silberperlen.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )),
              child: Container(
                margin: EdgeInsets.only(top: appBarHeight),
                child: TabBarView(children: [
                  CardWidget(
                    filter: blur,
                    child: ServicesWidget(),
                    width: maxContainerScreenSize,
                  ),
                  CardWidget(
                    filter: blur,
                    child: ServicesWidget(),
                    width: maxContainerScreenSize,
                  ),
                  CardWidget(
                    filter: blur,
                    child: ContactWidget(),
                    width: maxContainerScreenSize,
                  ),
                ]),
              ),
            ),
          ])),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  _calculateContainerSize(Size screenSize) {
    return screenSize.width < 768
        ? screenSize.width
        : max(2 * screenSize.width / 3, 720);
  }
}
