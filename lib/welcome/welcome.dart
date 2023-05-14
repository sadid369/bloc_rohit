import 'package:bloc_rohit/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 400,
              ),
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text("Sign In"),
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      })),
              Container(
                  width: double.infinity,
                  child:
                      ElevatedButton(child: Text("Sign Up"), onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
