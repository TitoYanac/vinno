import 'package:flutter/material.dart';

import '../molecules/drawer_list_tile.dart';

class MenuSideDrawer extends StatefulWidget {
  const MenuSideDrawer({super.key});

  @override
  State<MenuSideDrawer> createState() => _MenuSideDrawerState();
}

class _MenuSideDrawerState extends State<MenuSideDrawer> {
  final menuItems = [
    DrawerItem(Icons.home, 'Comunidad', () {}),
    DrawerItem(Icons.verified_user, 'Cuenta', () {}),
    DrawerItem(Icons.list_alt_outlined, 'Terminos y condiciones', () {}),
    DrawerItem(Icons.star_border, 'Calificanos', () {}),
    DrawerItem(Icons.support_agent, 'Soporte', () {}),
    DrawerItem(Icons.settings, 'Settings', () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22.0,
                  ),
                  SizedBox(width: 12,),
                  Text(
                    "Hola, Jesús",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ...menuItems.map((item) => DrawerListTile(
                  iconData: item.icon,
                  title: item.title,
                  onTap: item.onTap,
                )),
          ],
        ),
      ),
    );
  }
}

