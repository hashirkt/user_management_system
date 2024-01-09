import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserViewModel extends ChangeNotifier{


  List<UserModel> _users =[];

  List<UserModel> get users=> _users;

  Future addUser(UserModel user) async{

    _users.add(user);
    notifyListeners();
    print(_users);

  }

  Future<void> deleteUser(UserModel user) async{
    _users.remove(user);
    notifyListeners();
    print(_users);
  }
}