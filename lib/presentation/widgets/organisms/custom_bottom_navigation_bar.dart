import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_navigation_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<BottomNavItem> items = [
    BottomNavItem(Icons.home_sharp, 'Community', Icons.home_outlined),
    BottomNavItem(
        Icons.restaurant_sharp, 'Planning', Icons.restaurant_outlined),
    BottomNavItem(Icons.list_alt, 'My list', Icons.list_alt_outlined),
    BottomNavItem(Icons.person, 'Account', Icons.person_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocNavigationBar, BlocNavigationBarState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          color: Theme.of(context).colorScheme.primary,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 440), // Establece el ancho máximo a 440 píxeles
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              items: items
                  .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon,color: Colors.grey,),
                label: item.label,
                activeIcon: Icon(item.activeIcon),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ))
                  .toList(),
              elevation: 0.0,
              currentIndex: state.index,
              onTap: (index) {
                BlocProvider.of<BlocNavigationBar>(context).changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  final IconData activeIcon;

  BottomNavItem(this.icon, this.label, this.activeIcon);
}