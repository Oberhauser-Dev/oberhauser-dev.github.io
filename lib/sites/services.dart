import 'package:flutter/material.dart';
import 'package:oberhauser_dev/components/icon_fonts/devicon.dart';
import 'package:oberhauser_dev/components/icon_tile.dart';
import 'package:oberhauser_dev/components/listview.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 12),
        const Text(
            'The following technologies are offered for creating your web presence or app implementation.'),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        const Text(
          'Frameworks / Libraries',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget.icon(
            Devicon.flutter,
            url: 'https://flutter.dev/',
            tooltip: 'Flutter',
          ),
          IconTileWidget.icon(
            Devicon.react,
            url: 'https://reactjs.org/',
            tooltip: 'React (Native)',
          ),
          IconTileWidget.icon(
            Devicon.android,
            url: 'https://www.android.com/',
            tooltip: 'Android',
          ),
          IconTileWidget.icon(
            Devicon.nodejs,
            url: 'https://nodejs.org',
            tooltip: 'NodeJS',
          ),
          IconTileWidget.icon(
            Devicon.wordpress,
            url: 'https://wordpress.com/',
            tooltip: 'WordPress',
          ),
        ]),
        const Divider(),
        const SizedBox(height: 12),
        const Text(
          'Languages',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget.icon(
            Devicon.kotlin,
            url: 'https://kotlinlang.org/',
            tooltip: 'Kotlin',
          ),
          IconTileWidget.icon(
            Devicon.java,
            url: 'https://www.java.com/',
            tooltip: 'Java',
          ),
          IconTileWidget.icon(
            Devicon.php,
            url: 'https://www.php.net/',
            tooltip: 'PHP',
          ),
          IconTileWidget.icon(
            Devicon.dart,
            url: 'https://dart.dev/',
            tooltip: 'Dart',
          ),
          IconTileWidget.icon(
            Devicon.typescript,
            url: 'https://www.typescriptlang.org/',
            tooltip: 'Typescript',
          ),
          IconTileWidget.icon(
            Devicon.javascript,
            url: 'https://developer.mozilla.org/en-US/docs/Web/JavaScript',
            tooltip: 'Javascript',
          ),
        ]),
        const Divider(),
        const SizedBox(height: 12),
        const Text(
          'More',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget.icon(
            Devicon.illustrator,
            url: 'https://www.adobe.com/products/illustrator.html',
            tooltip: 'Illustrator',
          ),
          IconTileWidget.icon(
            Devicon.photoshop,
            url: 'https://www.adobe.com/products/photoshop.html',
            tooltip: 'Photoshop',
          ),
          IconTileWidget.icon(
            Icons.more_horiz,
            url: 'https://www.reb0.org/skills/',
            tooltip: 'See all skills',
          ),
        ]),
      ],
    );
  }
}
