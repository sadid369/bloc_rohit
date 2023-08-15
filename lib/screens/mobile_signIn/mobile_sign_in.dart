import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_cubit.dart';
import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_state.dart';
import 'package:bloc_rohit/screens/mobile_signIn/number_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          title: const Text("Sign In with Phone"),
        ),
        body: Container(
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
              Container(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (_, state) {
                    if (state is AuthCodeSentState) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return NumberVerification();
                        },
                      ));
                    }
                  },
                  builder: (_, state) {
                    if (state is AuthLoadingState) {
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      child: CupertinoButton(
                        color: Colors.blue,
                        onPressed: () {
                          String phoneNumber =
                              "+88" + phoneNumberController.text;
                          // context.read<AuthCubit>().sentOPT(phoneNumber);
                          BlocProvider.of<AuthCubit>(context)
                              .sentOPT(phoneNumber);
                        },
                        child: Text('Sign In'),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
