import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        const Divider(),
        const Padding(
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
              final String emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'info@oberhauser.dev',
                      query: 'subject=[Request] Project: MyProjectName&body='
                          '''Project: MyProjectName
Description: MyProjectDescription
Technologies: Flutter | React | Kotlin | NodeJS | etc.
Company: MyCompanyInfo''')
                  .toString();
              canLaunchUrlString(emailLaunchUri).then((value) =>
                  launchUrlString(emailLaunchUri, webOnlyWindowName: '_self'));
            },
            icon: const Icon(Icons.email),
            label: const Text('info@oberhauser.dev')),
        TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            icon: const Icon(Icons.language),
            label: const Text('oberhauser.dev')),
      ],
    );
  }
}
