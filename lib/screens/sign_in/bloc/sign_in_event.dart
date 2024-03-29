// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(
    this.emailValue,
    this.passwordValue,
  );
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(
    this.email,
    this.password,
  );
}
