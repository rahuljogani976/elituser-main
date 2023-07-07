part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class AddUserEvent extends UserEvent {
  final UserModel user;
  AddUserEvent({required this.user});
}

class UserFavUnFavEvent extends UserEvent {
  final String id;
  UserFavUnFavEvent({required this.id});
}
