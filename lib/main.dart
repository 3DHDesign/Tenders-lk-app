import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_lk_app/bloc/authentication/auth_bloc.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';
import 'package:tenders_lk_app/screens/home/HomeScreen.dart';
import 'package:tenders_lk_app/screens/login/loginScreen.dart';
import 'package:tenders_lk_app/screens/splashScreen.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('${bloc.runtimeType} $event');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('${bloc.runtimeType} $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('${bloc.runtimeType} $stackTrace');
    }
  }
}

class MyApp extends StatelessWidget {
  final UserRepositories userRepositories;
  const MyApp({super.key, required this.userRepositories});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(userRepositories: userRepositories),
      routes: {
        '/intro': (context) => SplashScreen(userRepositories: userRepositories),
        // '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepositories = UserRepositories();
  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(userRepositories: userRepositories)..add(AppStarted());
    },
    child: MyApp(userRepositories: userRepositories),
  ));
}
