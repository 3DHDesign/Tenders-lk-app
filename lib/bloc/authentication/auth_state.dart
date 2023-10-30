part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthenticateUninitialized extends AuthState {}

final class AuthenticateAuthenticated extends AuthState {}

final class AuthenticateUnauthenticated extends AuthState {}

final class AuthenticationLoading extends AuthState {}
