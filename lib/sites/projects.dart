import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oberhauser_dev/components/icon_fonts/devicon.dart';
import 'package:oberhauser_dev/components/icon_tile.dart';
import 'package:oberhauser_dev/components/listview.dart';

class ProjectsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12),
        Text('Check out the projects I have created or collaborated on.'),
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 12),
        Row(children: [
          Icon(Devicon.android),
          SizedBox(
            width: 12,
          ),
          Text(
            'Android',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
            textAlign: TextAlign.left,
          ),
        ]),
        ListViewWidget([
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/AppInsGruene_Logo.svg'),
            url: 'https://play.google.com/store/apps/details?id=de.lmu.treeapp',
            tooltip: 'App Ins Grüne (Collab., LMU Munich)',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Row(children: [
          Icon(Devicon.flutter),
          SizedBox(
            width: 12,
          ),
          Text(
            'Flutter',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
            textAlign: TextAlign.left,
          ),
        ]),
        ListViewWidget([
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/Oberhauser-Dev-simple.svg'),
            url: 'https://oberhauser.dev',
            tooltip: 'Oberhauser Development (this page)',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Row(children: [
          Icon(Devicon.react),
          SizedBox(
            width: 12,
          ),
          Text(
            'React (Native)',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
            textAlign: TextAlign.left,
          ),
        ]),
        ListViewWidget([
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/Naturfreunde_SkiAlpin_Logo_dark.svg'),
            url: 'https://expo.io/@naturfreunde/naturfreunde-ski-alpin',
            tooltip: 'Ski Alpin Schneesport App',
          ),
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/MemeGenerator.svg'),
            url: 'https://memes.reb0.org/',
            tooltip: 'Meme Generator (Collab., LMU Munich)',
          ),
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/GB-FullCalendar.svg'),
            url: 'https://github.com/Oberhauser-Dev/gb-fullcalendar',
            tooltip: 'GB FullCalendar',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Row(children: [
          Icon(Devicon.wordpress),
          SizedBox(
            width: 12,
          ),
          Text(
            'Wordpress',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
            textAlign: TextAlign.left,
          ),
        ]),
        ListViewWidget([
          IconTileWidget(
            SvgPicture.asset('assets/images/projects/TSV_Aichach_Favicon_Red.svg'),
            url: 'https://www.tsv-aichach.de/aktuelles/termine/',
            tooltip: 'TSV Aichach - Event Management',
          ),
        ]),
        Divider(),
        SizedBox(height: 12),
        Row(children: [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 12,
          ),
          Text(
            'More',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
            textAlign: TextAlign.left,
          ),
        ]),
        ListViewWidget([
          IconTileWidget.icon(
            Devicon.illustrator,
            url:
                'https://cloud.reb0.org/d/a746fab05bf44b37932f/?p=%2FPublikationen%2FTSV%20Aichach%2FAbteilungslogos&mode=list',
            tooltip: 'TSV Aichach - Illustrations',
          ),
          IconTileWidget.icon(
            Devicon.illustrator,
            url:
                'https://cloud.reb0.org/d/a746fab05bf44b37932f/?p=%2FPublikationen%2FTSV%20Aichach%2FRingen&mode=list',
            tooltip: 'TSV Aichach - Wrestling - Season Booklets',
          ),
          IconTileWidget.icon(
            Devicon.illustrator,
            url:
                'https://cloud.reb0.org/d/a746fab05bf44b37932f/?p=%2FPublikationen%2FSRG%20Ostschwaben&mode=list',
            tooltip: 'SRG Ostschwaben - Year Books',
          ),
        ]),
      ],
    );
  }
}
