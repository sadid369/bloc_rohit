import 'package:bloc_rohit/home_page.dart';
import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_cubit.dart';
import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                maxLength: 6,
                onChanged: (value) {},
                decoration: const InputDecoration(hintText: '6-Digit OTP'),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CupertinoButton(
                    color: Colors.blue,
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .verifyOPT(verificationController.text);
                    },
                    child: const Text('Verify'),
                  );
                },
              )
            ],
          ),
        ));
  }
}
