// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegisterScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up user
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords does not match!")),
      );
      return;
    }
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
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
                const Text(
                  "Create an account for you! :)",
                  style: TextStyle(fontSize: 16),
                ),
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
                SizedBox(height: 10.0),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  obscureText: true,
                ),
                SizedBox(height: 25.0),
                // sigin button
                MyButton(text: "Sign Up", onTap: signUp),

                SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a Member?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Now",
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
