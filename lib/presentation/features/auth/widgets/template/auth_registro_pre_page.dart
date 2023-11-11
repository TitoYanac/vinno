import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinno/presentation/features/community/pages/my_home_page.dart';

import '../../pages/auth_login.dart';

class AuthRegistroPrePage extends StatefulWidget {
  const AuthRegistroPrePage({super.key});

  @override
  State<AuthRegistroPrePage> createState() => _AuthRegistroPrePageState();
}

class _AuthRegistroPrePageState extends State<AuthRegistroPrePage> {

  final AuthService _auth = AuthService();
  Color _textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/icons/Icon_registro_user.png"),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RegÍstrate para tener una mejor experiencia",
             style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500
              )
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () async {
            _auth.signInWithGoogle().then((user){
              if (user != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyHomePage(user: user,),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Error al iniciar sesión")),
                );
              }
            });
          },
          onTapDown: (hasFocus) {
            print(hasFocus);
            setState(() {
              _textColor = Theme.of(context).colorScheme.primary;
            });
          },
          onTapUp: (val) {
            setState(() {
              _textColor = Colors.white;
            });
          },
          onTapCancel: () {
            setState(() {
              _textColor = Colors.white;
            });
          },
          splashColor: Colors.white,
          child: Ink(
            color: Theme.of(context).colorScheme.primary,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 1)),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 36),
              child: Text(
                "Continuar con Google",
                style: TextStyle(color: _textColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
