import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_system/features/user/models/user_model.dart';
import 'package:user_management_system/features/user/viewmodels/user_viewmodel.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.themeData,
    required this.index,
    required this.user,
  });

  final ThemeData themeData;
  final int index;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        trailing: IconButton(onPressed: (){

          showDialog(
              context: context,
              builder: (BuildContext context){
            return AlertDialog(
              title: Text("Confirm delete!"),
              content: Text("Are you sure you want to delete!?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Cancel",style: themeData.textTheme.bodySmall,)),
                TextButton(onPressed: (){
                  Provider.of<UserViewModel>(context, listen: false).deleteUser(user).then((value){
                    Navigator.of(context).pop();
                  });
                }, child: Text("Delete",style: themeData.textTheme.bodySmall,))
              ],
            );
          });
        }, icon: Icon(Icons.delete)),
        leading: CircleAvatar(
          backgroundColor: themeData.colorScheme.secondary,
          child: Center(
            child: Text("${index+1}",style: themeData.textTheme.bodySmall,),
          ),
        ),
        title: Text("${user.name}",style: themeData.textTheme.titleMedium,),
        subtitle: Text("${user.email}",style: themeData.textTheme.titleMedium,),
      ),
    );
  }
}