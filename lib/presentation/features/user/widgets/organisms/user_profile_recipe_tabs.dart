import 'package:flutter/material.dart';
class UserProfileRecipeTabs extends StatefulWidget {
  const UserProfileRecipeTabs({super.key});

  @override
  State<UserProfileRecipeTabs> createState() => _UserProfileRecipeTabsState();
}

class _UserProfileRecipeTabsState extends State<UserProfileRecipeTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            const Tab(icon: Icon(Icons.public), text: 'Publicados'),
            const Tab(icon: Icon(Icons.file_copy), text: 'Borradores'),
            const Tab(icon: Icon(Icons.bookmark), text: 'Guardados'),
            const Tab(icon: Icon(Icons.favorite), text: 'Favoritos'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTabContent('Publicados'),
              _buildTabContent('Borradores'),
              _buildTabContent('Guardados'),
              _buildTabContent('Favoritos'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(String tabName) {
    return Center(
      child: Text('Contenido de $tabName'),
    );
  }
}