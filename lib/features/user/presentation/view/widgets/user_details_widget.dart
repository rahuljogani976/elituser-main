import 'package:elituser/features/user/data/models/user_model.dart';
import 'package:elituser/features/user/presentation/manager/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;
  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                user.age,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(
                UserFavUnFavEvent(id: user.id),
              );
            },
            icon: user.liked
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  ),
          )
        ],
      ),
    );
  }
}
