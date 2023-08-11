import 'package:bloc_rohit/home_page.dart';
import 'package:bloc_rohit/routes.dart';
import 'package:bloc_rohit/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_rohit/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => SignInBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc With Rohit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const WelcomeScreen());
  }
}
