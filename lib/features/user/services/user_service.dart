import 'package:user_management_system/features/user/models/user_model.dart';
import 'package:user_management_system/features/user/viewmodels/user_viewmodel.dart';

class UserService{

  UserViewModel userViewModel =UserViewModel();

  Future addUser(UserModel user)async{

    final userdata= UserModel().toMap(user);

   userViewModel.addUser(userdata);

  }


  Future deleteUser(UserModel user) async{
    final userdata = UserModel().toMap(user);
    userViewModel.deleteUser(userdata);
  }

}


