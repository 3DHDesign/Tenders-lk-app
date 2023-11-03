part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class LoginButtonPressed extends LoginBlocEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  String toString() {
    return 'LoginButtonPressed {email: $email, password: $password}';
  }
}
