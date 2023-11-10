import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinno/presentation/core/utiles/custom_navigation.dart';
import 'package:vinno/presentation/features/auth/pages/auth_login.dart';
import 'package:vinno/presentation/features/community/pages/my_home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> loadData() async {
    Future.wait([_fetchDataFromApi(), _waitAnimation()]).then((value) =>
        CustomNavigation()
            .navigateToAndRemoveUntil(context, const MyHomePage()));
  }

  Future<void> _fetchDataFromApi() async {
    // Simula la carga de datos desde la API
    await Future.delayed(
        const Duration(seconds: 3)); // Reemplaza con tu llamada real a la API
  }

  Future<void> _waitAnimation() async {
    // Simula la carga de datos desde la API
    await Future.delayed(
        const Duration(seconds: 6)); // Reemplaza con tu llamada real a la API
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 250.0,
              height: 250.0,
              color: Colors.grey,
            ),
            SizedBox(
              width: 300.0,
              child: TextLiquidFill(
                text: 'Vinno',
                textStyle: GoogleFonts.lobster(
                  fontSize: 72.0,
                  color: Colors.white,
                ),
                waveColor: Colors.purple, // Color del líquido
                boxBackgroundColor: Colors.white,
                waveDuration: const Duration(seconds: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
