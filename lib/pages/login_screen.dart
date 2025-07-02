import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Icon(Icons.message, size: 80),

          // welcome back message

          // email textfield

          // password textfield

          // sigin button

          // not a member? register now
        ],
      ),
    );
  }
}
