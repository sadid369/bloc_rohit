// import 'package:bloc_rohit/cudits/internet_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: SafeArea(
//         child: Center(
//           // child: BlocBuilder<InternetBloc, InternetState>(
//           //   builder: (context, state) {
//           //     if (state is InternetGainedState) {
//           //       return const Text('Connected ');
//           //     } else if (state is InternetLostState) {
//           //       return const Text("Not Connected");
//           //     } else {
//           //       return const Text('Loading');
//           //     }
//           //   },
//           // ),
//           child: BlocConsumer<InternetCubit, InternetState>(
//             listener: (context, state) {
//               if (state == InternetState.GainedMobile ||
//                   state == InternetState.GainedWifi) {
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text(
//                     "Internet Connected",
//                   ),
//                   backgroundColor: Colors.green,
//                 ));
//               } else if (state == InternetState.Lost) {
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Internet Lost'),
//                   backgroundColor: Colors.red,
//                 ));
//               }
//             },
//             builder: (context, state) {
//               if (state == InternetState.GainedMobile ||
//                   state == InternetState.GainedWifi) {
//                 if (state == InternetState.GainedMobile) {
//                   return const Text('Connected Mobile');
//                 } else if (state == InternetState.GainedWifi) {
//                   return const Text('Connected Wifi');
//                 } else {
//                   return const Text('Connected');
//                 }
//               } else if (state == InternetState.Lost) {
//                 return const Text("Not Connected");
//               } else {
//                 return const Text('Loading');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
