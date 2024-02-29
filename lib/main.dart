import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oberhauser_dev/components/card.dart';
import 'package:oberhauser_dev/sites/contact.dart';
import 'package:oberhauser_dev/sites/projects.dart';
import 'package:oberhauser_dev/sites/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

const appTitle = 'Oberhauser Development';

class MyApp extends StatelessWidget {
  static MaterialColor primary = MaterialColor(
    Colors.grey.shade900.value,
    <int, Color>{
      50: const Color(0xFFE3F2FD),
      100: const Color(0xFFBBDEFB),
      200: const Color(0xFF90CAF9),
      300: const Color(0xFF64B5F6),
      400: const Color(0xFF42A5F5),
      500: Color(Colors.grey.shade900.value),
      600: const Color(0xFF1E88E5),
      700: const Color(0xFF1976D2),
      800: const Color(0xFF1565C0),
      900: const Color(0xFF0D47A1),
    },
  );

  const MyApp({Key? key}) : super(key: key);

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
      home: const NavigationBar(),
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
  final blur = ImageFilter.blur(sigmaX: 16, sigmaY: 16);
  final RestorableInt _currentIndex = RestorableInt(0);
  final urlPrivateHomepage = 'https://reb0.org';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double maxContainerScreenSize = _calculateContainerSize(screenSize);
    const double appBarHeight = 56;
    const double footerHeight = 24;
    var appBar = SizedBox(
      width: screenSize.width,
      child: Center(
        child: SizedBox(
          width: maxContainerScreenSize,
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/Oberhauser-Dev-simple-sw.svg',
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                semanticsLabel: appTitle,
                width: 30,
              ),
              padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.only(right: 20),
              onPressed: () => canLaunchUrlString(urlPrivateHomepage)
                  .then((value) => launchUrlString(urlPrivateHomepage)),
              tooltip: 'Private Homepage',
              icon: const Icon(Icons.face),
            ),
          ]),
        ),
      ),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, appBarHeight),
          child: Container(
            color: Colors.black45,
            child: ClipRRect(
              child: BackdropFilter(
                filter: blur,
                child: appBar,
              ),
            ),
          ),
        ),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Colors.brown.shade50, BlendMode.color),
            image: const AssetImage('assets/images/Silberperlen.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )),
          child: Column(children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: appBarHeight),
                child: TabBarView(children: [
                  CardWidget(
                    filter: blur,
                    width: maxContainerScreenSize,
                    child: const ServicesWidget(),
                  ),
                  CardWidget(
                    filter: blur,
                    width: maxContainerScreenSize,
                    child: const ProjectsWidget(),
                  ),
                  CardWidget(
                    filter: blur,
                    width: maxContainerScreenSize,
                    child: const ContactWidget(),
                  ),
                ]),
              ),
            ),
            Container(
                height: footerHeight,
                color: Colors.black45,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: blur,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '© ${DateTime.now().year} August Oberhauser',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 10),
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      ),
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
