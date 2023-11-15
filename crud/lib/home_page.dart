import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Signed In as: ${user?.email}",
            style: const TextStyle(fontSize: 30),
          ),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: const Color.fromARGB(255, 9, 83, 11),
            child: const Text('Sign out'),
          )
        ],
      )),
    );
  }
}
