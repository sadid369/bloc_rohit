import 'package:bloc_rohit/screens/mobile_signIn/number_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileSignIn extends StatefulWidget {
  const MobileSignIn({Key? key}) : super(key: key);

  @override
  State<MobileSignIn> createState() => _MobileSignInState();
}

class _MobileSignInState extends State<MobileSignIn> {
  var phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In with Email"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneNumberController,
                onChanged: (value) {},
                decoration: const InputDecoration(hintText: 'Phone number'),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                child: Text('Sign In'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const NumberVerification();
                    },
                  ));
                },
              )
            ],
          ),
        ));
  }
}
