import 'package:bloc_rohit/screens/mobile_signIn/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  void sentOPT(String phoneNumber) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {
        emit(AuthCodeSentState());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  void verifyOPT(String otp) async {}
  void signInWithPhone() async {}
}
