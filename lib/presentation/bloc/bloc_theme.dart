import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTheme extends Bloc<BlocThemeEvent, BlocThemeState> {
  BlocTheme() : super(ThemeLight()) {
    on<ToggleTheme>((_, emit) =>
        (state is ThemeLight) ? emit(ThemeDark()) : emit(ThemeLight()));
  }

  void changeTheme() => add(ToggleTheme());
}

class BlocThemeEvent {}

class ToggleTheme extends BlocThemeEvent {}

class BlocThemeState {
  final ThemeData themeData;
  const BlocThemeState(this.themeData);
}

class ThemeLight extends BlocThemeState {
  ThemeLight() : super(_buildThemeLight());

  static ThemeData _buildThemeLight() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 236, 1),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromRGBO(130, 15, 40, 1),
        onPrimary: Colors.white,
        secondary: Color.fromRGBO(9, 71, 94, 1),
        onSecondary: Colors.white,
        tertiary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Color.fromRGBO(62, 68, 71, 1),//icons navbar
        surface: Color.fromRGBO(253, 253, 253, 1),
        onSurface: Color.fromRGBO(120, 120, 120, 1),
        onSurfaceVariant: Colors.white,
        shadow: Colors.white,
        
      ),
    );
  }
}

class ThemeDark extends BlocThemeState {
  ThemeDark() : super(_buildThemeDark());

  static ThemeData _buildThemeDark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 236, 1),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromRGBO(130, 15, 40, 1),
        onPrimary: Colors.white,
        secondary: Color.fromRGBO(9, 71, 94, 1),
        onSecondary: Colors.white,
        tertiary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Color.fromRGBO(62, 68, 71, 1),//icons navbar
        surface: Color.fromRGBO(253, 253, 253, 1),
        onSurface: Color.fromRGBO(120, 120, 120, 1),
        onSurfaceVariant: Colors.white,
        shadow: Colors.white,

      ),
    );
  }
}
