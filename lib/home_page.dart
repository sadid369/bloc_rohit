import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_cubit.dart';
import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_state.dart';
import 'package:bloc_rohit/screens/mobile_signIn/mobile_sign_in.dart';
import 'package:bloc_rohit/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return MobileSignIn();
                  },
                ));
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                child: const Text('Logout'),
              );
            },
          ),
        ),
      ),
    );
  }
}
