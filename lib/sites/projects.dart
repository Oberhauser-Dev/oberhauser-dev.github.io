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
          'Android',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        Divider(),
        Text(
          'Flutter',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(Devicon.react),
          IconTileWidget(Devicon.android),
          IconTileWidget(Devicon.flutter),
          IconTileWidget(Devicon.nodejs),
          IconTileWidget(Devicon.wordpress),
        ]),
        Divider(),
        Text(
          'React (Native)',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(Devicon.kotlin),
          IconTileWidget(Devicon.java),
          IconTileWidget(Devicon.php),
          IconTileWidget(Devicon.dart),
          IconTileWidget(Devicon.typescript),
          IconTileWidget(Devicon.javascript),
        ]),
        Divider(),
        Text(
          'Wordpress',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        ListViewWidget([
          IconTileWidget(Devicon.illustrator),
          IconTileWidget(Devicon.photoshop),
          IconTileWidget(Icons.more_horiz),
        ]),
      ],
    );
  }
}
