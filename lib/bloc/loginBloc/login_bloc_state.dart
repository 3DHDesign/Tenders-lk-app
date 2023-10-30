part of 'login_bloc_bloc.dart';

sealed class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginBlocState {}

final class LoginLoading extends LoginBlocState {}

final class LoginFailure extends LoginBlocState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Loggin error {$error}';
}
