import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/organisms/user_body_card_profile.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key, required this.user});
  final User user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> with SingleTickerProviderStateMixin {
  late double _heightCard;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _heightCard = 160;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: UserBodyCardProfile(user: widget.user, heightCard: _heightCard),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).colorScheme.primary,
              indicatorColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: const Color.fromRGBO(120, 120, 120, 1),
              tabs: const [
                Tab(icon: Icon(Icons.public), text: 'Publicados'),
                Tab(icon: Icon(Icons.file_copy), text: 'Borradores'),
                Tab(icon: Icon(Icons.bookmark), text: 'Guardados'),
                Tab(icon: Icon(Icons.favorite), text: 'Favoritos'),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                // Aquí puedes añadir el contenido de cada pestaña
                Center(child: Text('Contenido de Publicados')),
                Center(child: Text('Contenido de Borradores')),
                Center(child: Text('Contenido de Guardados')),
                Center(child: Text('Contenido de Favoritos')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
