import 'package:bloc_network/Theme/color.dart';
import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if(state is UserEmptyState){
          return Center(child: Text("No data click Loaded"));
        }
        if(state is UserLoadingState) {
          return Center(child: CircularProgressIndicator(
          ));
        }
        if(state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: (index % 2 == 0) ? tile_one : tile_second,
              child: ListTile(
                leading: Text(
                  "ID: ${state.loadedUser[index].id}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                title: Column(children: [
                  Text(
                    state.loadedUser[index].name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${state.loadedUser[index].email}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${state.loadedUser[index].number}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
              ),
            );
          },
        );
        }
        if(state is UserErrorState) {
          return Center(child: Text('Error fetching User'));
        }

        return Container();
      },
    );
  }
}
