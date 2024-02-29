import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IconTileWidget extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final String? url;
  final String? tooltip;

  const IconTileWidget(this.icon, {Key? key, this.color, this.url, this.tooltip}) : super(key: key);

  IconTileWidget.icon(IconData iconData, {Key? key, this.color, this.url, this.tooltip})
      : icon = Icon(iconData), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 22),
      child: SizedBox(
        width: 140,
        child: IconButton(
          padding: const EdgeInsets.all(28),
          color: color ?? Colors.grey.shade100,
          iconSize: 72,
          icon: icon,
          onPressed: () {
            if (url != null) {
              canLaunchUrlString(url!)
                  .then((value) => launchUrlString(url!));
            }
          },
          tooltip: tooltip,
        ),
      ),
    );
  }
}
