import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:vinno/presentation/features/auth/widgets/template/auth_registro_pre_page.dart';
import 'package:vinno/presentation/features/community/pages/cronometro_page.dart';
import 'package:vinno/presentation/features/community/widgets/template/community_body.dart';
import 'package:vinno/presentation/features/recipe/pages/recipe_creator_screen.dart';

import '../../../bloc/bloc_navigation_bar.dart';
import '../../../widgets/organisms/custom_app_bar.dart';
import '../../../widgets/organisms/custom_bottom_navigation_bar.dart';
import '../../../widgets/organisms/menu_side_drawer.dart';
import 'create_random_recipe_test.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.user});
  final User? user;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  late List<Widget> contenido ;
  final PageController _controllerPageView = PageController();
  @override
  void initState() {
    if(widget.user!=null){
      contenido = [
        const CommunityBody(),
        //const CreateRandomRecipeTest(),

        const Center(child: Text("1")),
        //const Center(child: Text("2")),
        const RecipeCreatorScreen(),
        //const CronometroPage(),
        Center(child: Text(widget.user!.displayName!)),

      ];
    }else{
      contenido = [
        const CommunityBody(),
        //const CreateRandomRecipeTest(),

        const Center(child: Text("1")),
        const Center(child: Text("2")),
        //const RecipeCreatorScreen(),
        //const CronometroPage(),
        const AuthRegistroPrePage(),

      ];
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      inverse: false,
      menu: const MenuSideDrawer(),
      type: SideMenuType.slideNRotate,
      background: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        appBar: CustomAppbar(sideMenuKey: _sideMenuKey),
        body: BlocBuilder<BlocNavigationBar, BlocNavigationBarState>(
          builder: (context, state) {
            return contenido[state.index];
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
