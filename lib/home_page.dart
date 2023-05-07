import 'package:bloc_rohit/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_rohit/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SafeArea(child: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Connected');
            } else if (state is InternetLostState) {
              return const Text("Not Connected");
            } else {
              return const Text('Loading');
            }
          },
        ),
      )),
    );
    ;
  }
}
