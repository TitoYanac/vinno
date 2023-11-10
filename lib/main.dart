import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinno/presentation/bloc/bloc_navigation_bar.dart';
import 'package:vinno/presentation/bloc/bloc_theme.dart';
import 'package:vinno/presentation/features/community/pages/my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/datasource/remote/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ThemeApp());
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocTheme(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocNavigationBar(),
        ),
      ],
      child: BlocBuilder<BlocTheme, BlocThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Vinno',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
