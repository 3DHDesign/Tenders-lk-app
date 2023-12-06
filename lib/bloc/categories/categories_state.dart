part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {
  // final String error;

  // const LoginFailure({required this.error});

  // @override
  // List<Object?> get props => [error];

  // @override
  // String toString() {
  //   return 'Loggin error {$error}';
  // }
}
