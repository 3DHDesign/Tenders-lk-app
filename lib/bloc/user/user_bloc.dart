import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tenders_lk_app/models/User.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield* _mapFetchUserToState();
    }
  }

  Stream<UserState> _mapFetchUserToState() async* {
    final Dio _dio = Dio(BaseOptions(
      contentType: 'application/json',
    ));
    try {
      // Make API request here
      Response response =
          await _dio.get('http://192.168.1.158:8000/api/api/user');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response);
        }
        // final Map<String, dynamic> data = json.decode(response);
        // final user = User.fromJson(data);
        // yield UserLoaded(user: user);
      } else {
        yield UserError(error: 'Failed to load user data');
      }
    } catch (e) {
      yield UserError(error: 'Error: $e');
    }
  }
}
