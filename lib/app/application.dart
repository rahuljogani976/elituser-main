import 'package:elituser/features/user/presentation/manager/user_bloc/user_bloc.dart';
import 'package:elituser/features/user/presentation/view/pages/add_show_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mellitus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (_) => UserBloc(),
        child: const AddShowUserPage(),
      ),
    );
  }
}

