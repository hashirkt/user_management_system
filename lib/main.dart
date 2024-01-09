
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management_system/core/services/theme_service.dart';
import 'package:user_management_system/core/theme.dart';
import 'package:user_management_system/features/user/view/add_user_view.dart';
import 'package:user_management_system/features/user/view/home_view.dart';
import 'package:user_management_system/features/user/viewmodels/user_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ThemeServiceProvider()),
          ChangeNotifierProvider(create: (context)=>UserViewModel()),
        ],
    child:  const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(builder: (context,themeprovider,child){
      return  MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context)=>HomePage(),
          '/newuser':(context)=>AddUser(),
        },
        title: 'User Management',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeprovider.isDarkModeOn? ThemeMode.dark:ThemeMode.light,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
