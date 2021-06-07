import 'package:flutter/material.dart';
import 'package:oberhauser_dev/sites/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar Sample'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Share',
                  child: ListTile(
                      leading: Icon(Icons.share), title: Text('Share'))),
              PopupMenuDivider(),
            ],
            padding: EdgeInsets.zero,
            onSelected: (value) => print(value),
          )
        ],
      ),
      body: LoginForm(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _currentIndex.value,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
      ),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }
}
