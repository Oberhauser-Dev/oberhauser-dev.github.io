import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oberhauser_dev/components/icon_fonts/devicon.dart';
import 'package:oberhauser_dev/components/icon_tile.dart';
import 'package:oberhauser_dev/components/listview.dart';

class ServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12),
        Text('I offer the following technologies, with which you can have your web presence implemented.'),
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 12),
        Text(
          'Frameworks / Libraries',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(
            Devicon.flutter,
            url: 'https://flutter.dev/',
            tooltip: 'Flutter',
          ),
          IconTileWidget(
            Devicon.react,
            url: 'https://reactjs.org/',
            tooltip: 'React (Native)',
          ),
          IconTileWidget(
            Devicon.android,
            url: 'https://www.android.com/',
            tooltip: 'Android',
          ),
          IconTileWidget(
            Devicon.nodejs,
            url: 'https://nodejs.org',
            tooltip: 'NodeJS',
          ),
          IconTileWidget(
            Devicon.wordpress,
            url: 'https://wordpress.com/',
            tooltip: 'WordPress',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Text(
          'Languages',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(
            Devicon.kotlin,
            url: 'https://kotlinlang.org/',
            tooltip: 'Kotlin',
          ),
          IconTileWidget(
            Devicon.java,
            url: 'https://www.java.com/',
            tooltip: 'Java',
          ),
          IconTileWidget(
            Devicon.php,
            url: 'https://www.php.net/',
            tooltip: 'PHP',
          ),
          IconTileWidget(
            Devicon.dart,
            url: 'https://dart.dev/',
            tooltip: 'Dart',
          ),
          IconTileWidget(
            Devicon.typescript,
            url: 'https://www.typescriptlang.org/',
            tooltip: 'Typescript',
          ),
          IconTileWidget(
            Devicon.javascript,
            url: 'https://developer.mozilla.org/en-US/docs/Web/JavaScript',
            tooltip: 'Javascript',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Text(
          'More',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(
            Devicon.illustrator,
            url: 'https://www.adobe.com/products/illustrator.html',
            tooltip: 'Illustrator',
          ),
          IconTileWidget(
            Devicon.photoshop,
            url: 'https://www.adobe.com/products/photoshop.html',
            tooltip: 'Photoshop',
          ),
          IconTileWidget(
            Icons.more_horiz,
            url: 'https://www.reb0.org/skills/',
            tooltip: 'See all skills',
          ),
        ]),
      ],
    );
  }
}
