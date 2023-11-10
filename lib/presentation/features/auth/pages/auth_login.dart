import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogin extends StatefulWidget {
  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Logeate con google en el siguiente boton:"),
            ElevatedButton(
              onPressed: () async {
                final user = await _auth.signInWithGoogle();
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Page2(user: user),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error al iniciar sesión")),
                  );
                }
              },
              child: const Text("Sign in with Google"),
            )
          ],
        ),
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
        await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        if (user != null) {
          final users = _firestore.collection('users');
          final userDoc = users.doc(user.uid);
          await userDoc.get().then((doc) {
            var fecha = Timestamp.now();
            if (!doc.exists) {
              userDoc.set({
                'email': user.email,
                'displayName': user.displayName,
                'photoURL': user.photoURL,
                'phoneNumber': user.phoneNumber,
                'uid': user.uid,
                'emailVerified': user.emailVerified.toString(),
                'lastLogin': fecha,
                'createdAt': fecha,
                'updatedAt': fecha
              });
            }
          });
          return user;
        }
      }
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }
}

class Page2 extends StatelessWidget {
  final User user;

  const Page2({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${user.displayName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.photoURL != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            const SizedBox(height: 10),
            Text('Nombre: ${user.displayName}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
