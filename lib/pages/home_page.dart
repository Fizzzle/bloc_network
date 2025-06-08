import 'package:bloc_network/Theme/color.dart';
import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_event.dart';
import 'package:bloc_network/services/user_repository.dart';
import 'package:bloc_network/widgets/action_buttons.dart';
import 'package:bloc_network/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => UserBloc(userRepository: userRepository),

      //ВЫПОЛНИТЬ КАК ТОЛЬКО ЗАПУСТИТЬСЯ
      create: (context) => UserBloc(userRepository: context.read<UserRepository>())..add(UserLoadEvent()),
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: bg,
          title: Text("Users"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(
              child: UserList(),
            ),
          ],
        ),
      ),
    );
  }
}
