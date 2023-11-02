import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tenders_lk_app/bloc/authentication/auth_bloc.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final UserRepositories userRepositories;
  final AuthBloc authBloc;

  LoginBloc(
    super.initialState, {
    @required this.userRepositories,
    @required this.authBloc,
  })  : assert(userRepositories != null),
        assert(authBloc != null);

  @override
  LoginBlocState get initialState => LoginInitial();

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginBlocState();

      try {
        final token = await userRepositories.login(event.email, event.password);
        authBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
