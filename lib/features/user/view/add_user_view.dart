import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_system/features/user/models/user_model.dart';
import 'package:user_management_system/features/user/viewmodels/user_viewmodel.dart';
import 'package:uuid/uuid.dart';

import '../widgets/textfield_widget.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final _userKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  var uuid=Uuid();
  var id;
  @override
  void initState() {
id=uuid.v1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    return Scaffold(

      appBar: AppBar(
        title: Text("User Management",style: themeData.textTheme.displayLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Form(
          key: _userKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add new user"),
            CustomTextfield(controller: _namecontroller, hintText: 'Enter name',inputtype: TextInputType.name,),
            SizedBox(height: 20,),
            CustomTextfield(controller: _emailcontroller, hintText: 'Enter email address',inputtype: TextInputType.emailAddress,),
            SizedBox(height: 30,),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.colorScheme.secondary
                ),
                  onPressed: (){

                  if(_userKey.currentState!.validate()){

                    UserModel user=UserModel(
                      id:id,
                      name:_namecontroller.text,
                      email: _emailcontroller.text,
                      status: 1,
                      createdAt: DateTime.now(),
                    );

                    Provider.of<UserViewModel>(context,listen: false).addUser(user).then((value){
                      Navigator.pop(context);
                    });
                  }



                  },
                  child: Text("Save",style: themeData.textTheme.titleMedium,)
              ),
            )
          ],
        )),
      ),
    );
  }
}


