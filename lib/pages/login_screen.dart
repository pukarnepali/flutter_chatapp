import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  Future<void> signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 25),
                // logo
                Icon(Icons.message, size: 100, color: Colors.grey[800]),
                SizedBox(height: 25.0),
                // welcome back message
                const Text("Welcome Back", style: TextStyle(fontSize: 16)),
                SizedBox(height: 25.0),
                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),
                SizedBox(height: 10.0),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 25.0),
                // sigin button
                MyButton(text: "Login", onTap: signIn),

                SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a Member?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
