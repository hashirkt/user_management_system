import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputtype
  }) ;

  final TextEditingController controller;
  final String hintText;
  final TextInputType? inputtype;


  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return TextFormField(
      keyboardType: inputtype,
      validator: (value){
        if(value!.isEmpty){
          return "This field is required";
        }
      },
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
      hintStyle: themedata.textTheme.titleSmall
      ),

    );

  }
}