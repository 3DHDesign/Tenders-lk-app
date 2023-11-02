part of 'login_bloc_bloc.dart';

sealed class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

abstract class LoginButtonPressed extends LoginBlocEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed {email: $email, password: $password}';
}
