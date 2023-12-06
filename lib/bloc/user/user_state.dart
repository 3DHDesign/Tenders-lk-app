part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded({required this.user});
}

class UserError extends UserState {
  final String error;

  UserError({required this.error});
}
