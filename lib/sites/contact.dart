import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: SelectableText('''
August Oberhauser
Johann-Clanze-Str. 32,
81369 Munich, Germany
'''),
        ),
        TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              final String _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'info@oberhauser.dev',
                      query: 'subject=[Request] Project: MyProjectName&body=' +
                          '''Project: MyProjectName
Description: MyProjectDescription
Technologies: Flutter | React | Kotlin | NodeJS | etc.
Company: MyCompanyInfo''')
                  .toString();
              canLaunch(_emailLaunchUri)
                  .then((value) => launch(_emailLaunchUri, webOnlyWindowName: '_self'));
            },
            icon: Icon(Icons.email),
            label: const Text('info@oberhauser.dev')),
        TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {},
            icon: Icon(Icons.language),
            label: const Text('oberhauser.dev')),
      ],
    );
  }
}
