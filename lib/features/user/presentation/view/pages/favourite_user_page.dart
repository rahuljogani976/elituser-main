import 'package:elituser/features/user/presentation/manager/user_bloc/user_bloc.dart';
import 'package:elituser/features/user/presentation/view/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteUserPage extends StatelessWidget {
  const FavouriteUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite User'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserInitial) {
            return const Text('Add user!');
          }
          if (state is UserInitial) {
            return const CircularProgressIndicator.adaptive();
          }
          if (state is AddUserSuccess) {
            final favList =
                state.userList.where((element) => element.liked).toList();
            if (favList.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(25),
                child: Center(child: Text('There is no fav user!')),
              );
            }
            return ListView.separated(
              itemCount: favList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, index) {
                return UserDetails(
                  user: favList[index],
                );
              },
            );
          }
          return const SizedBox(
            child: Text('Something went wrong!'),
          );
        },
      ),
    );
  }
}
