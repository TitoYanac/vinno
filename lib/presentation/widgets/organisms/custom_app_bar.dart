import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../atoms/brand_text.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.sideMenuKey});
  final GlobalKey<SideMenuState> sideMenuKey;
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.preferredSize.height,
      title: BrandText(title: 'Logo',color: Theme.of(context).colorScheme.primary),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary,),
          onPressed: () {
            if (widget.sideMenuKey.currentState!.isOpened) {
              widget.sideMenuKey.currentState!.closeSideMenu();
            } else {
              widget.sideMenuKey.currentState!.openSideMenu();
            }
          },
        ),
      ],
    );
  }
}