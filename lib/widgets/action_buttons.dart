import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    // final UserBloc _userBloc = context.read<UserBloc>(); 

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {
          _userBloc.add(UserLoadEvent());
        }, 
        child: Text("Загрузка"), 
      
        ),
        SizedBox(width: 10,),
          ElevatedButton(onPressed: () {
            _userBloc.add(UserClearEvent());
          }, 
        child: Text("Очистка"), 
      
        ),
      ],
    );
  }
}