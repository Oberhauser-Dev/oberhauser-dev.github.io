import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
Großhausener Str. 16,
86551 Aichach, Germany
'''),
        ),
        TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
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
              canLaunchUrlString(_emailLaunchUri).then((value) =>
                  launchUrlString(_emailLaunchUri, webOnlyWindowName: '_self'));
            },
            icon: Icon(Icons.email),
            label: const Text('info@oberhauser.dev')),
        TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            icon: Icon(Icons.language),
            label: const Text('oberhauser.dev')),
      ],
    );
  }
}
