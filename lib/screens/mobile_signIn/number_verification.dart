import 'package:bloc_rohit/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberVerification extends StatefulWidget {
  const NumberVerification({Key? key}) : super(key: key);

  @override
  _NumberVerificationState createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  var verificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In with Email"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: verificationController,
                onChanged: (value) {},
                decoration: const InputDecoration(hintText: '6-Digit OTP'),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: const Text('Verify'),
              )
            ],
          ),
        ));
  }
}
