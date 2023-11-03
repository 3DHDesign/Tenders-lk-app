part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthenticateUninitialized extends AuthState {}

final class AuthenticateAuthenticated extends AuthState {}

final class AuthenticateUnauthenticated extends AuthState {}

final class AuthenticationLoading extends AuthState {}
