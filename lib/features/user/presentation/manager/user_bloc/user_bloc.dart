import 'package:elituser/features/user/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<AddUserEvent>(addUser);
    on<UserFavUnFavEvent>(favUnFav);
  }

  List<UserModel> users = [];

  void addUser(AddUserEvent event, Emitter emit) {
    emit(AddUserLoading());
    users.add(event.user);
    emit(AddUserSuccess(userList: users));
  }

  void favUnFav(UserFavUnFavEvent event, Emitter emit) {
    emit(AddUserLoading());
    final i = users.indexWhere((element) => element.id == event.id);
    users[i].liked = !users[i].liked;
    emit(AddUserSuccess(userList: users));
  }
}
