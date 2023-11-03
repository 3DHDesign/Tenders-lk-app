import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepositories userRepositories;

  AuthBloc({required this.userRepositories})
      : super(AuthenticateUninitialized()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await userRepositories.hasToken();
      if (hasToken) {
        emit(AuthenticateAuthenticated());
      } else {
        emit(AuthenticateUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepositories.persisteToken(event.token);
      emit(AuthenticateAuthenticated());
    });

    on<LogOut>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepositories.deleteToken();
      emit(AuthenticateUnauthenticated());
    });
  }
}
