import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepositories userRepositories;
  AuthBloc({required this.userRepositories}) : assert(userRepositories != null);

  @override
  AuthState get initialState => AuthenticateUninitialized();

  @override
  Stream<AuthState> mapEventState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepositories.hasToken();
      if (hasToken) {
        yield AuthenticateAuthenticated();
      } else {
        yield AuthenticateUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepositories.persisteToken(event.token);
      yield AuthenticateAuthenticated();
    }
    if (event is LogOut) {
      yield AuthenticationLoading();
      await userRepositories.deleteToken();
      yield AuthenticateUnauthenticated();
    }
  }
}
