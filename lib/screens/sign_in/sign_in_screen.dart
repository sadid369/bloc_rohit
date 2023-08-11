import 'package:bloc_rohit/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_rohit/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_rohit/screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/sign_in_screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInTextChangeEvent(
                    emailController.text,
                    passwordController.text,
                  ));
                },
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInTextChangeEvent(
                    emailController.text,
                    passwordController.text,
                  ));
                },
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CupertinoButton(
                    child: Text('Sign In'),
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context)
                            .add(SignInSubmittedEvent(
                          emailController.text,
                          passwordController.text,
                        ));
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
