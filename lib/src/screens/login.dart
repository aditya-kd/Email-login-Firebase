import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj3/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "", _password = "";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Sign in'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Sign up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
