import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Log out'),
          onPressed: () {
            auth.signOut();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
