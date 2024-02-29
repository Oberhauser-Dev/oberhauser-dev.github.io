import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IconTileWidget extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final String? url;
  final String? tooltip;

  IconTileWidget(this.icon, {this.color, this.url, this.tooltip});

  IconTileWidget.icon(IconData iconData, {this.color, this.url, this.tooltip})
      : this.icon = Icon(iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 22),
      child: Container(
        child: IconButton(
          padding: EdgeInsets.all(28),
          color: this.color ?? Colors.grey.shade100,
          iconSize: 72,
          icon: icon,
          onPressed: () {
            if (this.url != null) {
              canLaunchUrlString(this.url!)
                  .then((value) => launchUrlString(this.url!));
            }
          },
          tooltip: tooltip,
        ),
        width: 140,
      ),
    );
  }
}
