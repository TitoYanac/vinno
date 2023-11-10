import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const DrawerListTile({
    Key? key,
    required this.iconData,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading:
      Icon(iconData, size: 20.0, color: Theme.of(context).colorScheme.background),
      title:
      Text(title, style: TextStyle(color: Theme.of(context).colorScheme.background)),
      dense: true,
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;
  final Function()? onTap;

  DrawerItem(this.icon, this.title, this.onTap);
}