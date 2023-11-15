import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UserBodyCardProfile extends StatefulWidget {
  const UserBodyCardProfile({super.key, required this.user, required this.heightCard});
  final double heightCard;
  final User user;

  @override
  State<UserBodyCardProfile> createState() => _UserBodyCardProfileState();
}

class _UserBodyCardProfileState extends State<UserBodyCardProfile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        height: widget.heightCard,
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 35,
                child: Container(
                  color: Colors.transparent,
                  child: (widget.user.photoURL == null)? const Icon(Icons.warning):Image.network(widget.user.photoURL!, fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const LinearProgressIndicator();
                        }
                      }),
                ),
              ),
              Expanded(
                flex: 65,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    children: [
                      Expanded(child: Center(child: Row(
                        children: [
                          Text(widget.user.displayName!,style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                        ],
                      ))),
                      Expanded(child: Center(child: Row(
                        children: [
                          Text(widget.user.email!,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              )),
                        ],
                      ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
