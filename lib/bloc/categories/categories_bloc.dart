import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final UserRepositories userRepositories;

  CategoriesBloc({required this.userRepositories})
      : super(CategoriesInitial()) {
    on<CategoriesInitialFetchEvent>((event, emit) async {
      final token = await userRepositories.hasToken();
      if (kDebugMode) {
        debugPrint('Tokennnnnnnnnnnnnnnnn $token');
      }
    });
  }
}
