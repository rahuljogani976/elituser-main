import 'dart:math';

import 'package:elituser/core/helpers/validation_helpers.dart';
import 'package:elituser/features/user/data/models/user_model.dart';
import 'package:elituser/features/user/presentation/manager/user_bloc/user_bloc.dart';
import 'package:elituser/features/user/presentation/view/pages/favourite_user_page.dart';
import 'package:elituser/features/user/presentation/view/widgets/app_textfield.dart';
import 'package:elituser/features/user/presentation/view/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddShowUserPage extends StatefulWidget {
  const AddShowUserPage({Key? key}) : super(key: key);

  @override
  State<AddShowUserPage> createState() => _AddShowUserPageState();
}

class _AddShowUserPageState extends State<AddShowUserPage> {
  TextEditingController nameCLR = TextEditingController();
  TextEditingController ageCLR = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<UserBloc>(context),
                            child: const FavouriteUserPage())));
              },
              icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: nameCLR,
                    hintText: 'Enter a Name',
                    label: 'Name',
                    validator: ValidationHelpers.nameField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    controller: ageCLR,
                    hintText: 'Enter age',
                    label: 'Age',
                    validator: ValidationHelpers.ageValidation,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          BlocProvider.of<UserBloc>(context).add(
                            AddUserEvent(
                              user: UserModel(
                                id: Random().nextInt(1000000).toString(),
                                name: nameCLR.text,
                                age: ageCLR.text,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text('Save'.toUpperCase()))
                ],
              ),
            ),
          ),
          BlocConsumer<UserBloc, UserState>(
            listener: (_, state) {
              if (state is AddUserSuccess) {
                nameCLR.clear();
                ageCLR.clear();
              }
            },
            builder: (_, state) {
              if (state is UserInitial) {
                return const Text('Add user!');
              }
              if (state is UserInitial) {
                return const CircularProgressIndicator.adaptive();
              }
              if (state is AddUserSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.userList.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      return UserDetails(
                        user: state.userList[index],
                      );
                    },
                  ),
                );
              }
              return const SizedBox(
                child: Text('Something went wrong!'),
              );
            },
          )
        ],
      ),
    );
  }
}
