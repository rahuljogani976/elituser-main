part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class AddUserLoading extends UserState {}

class AddUserSuccess extends UserState {
  final List<UserModel> userList;

  AddUserSuccess({required this.userList});
}

class AddUserFailure extends UserState {}
