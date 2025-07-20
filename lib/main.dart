import 'package:chat_app/screens/MainPage.dart';
import 'package:chat_app/screens/SignUp.dart';
import 'package:chat_app/styles/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/SignIn.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: Appcolors.background,
        
      ),
      initialRoute: '/signin',
      routes: {
        '/signin':(context) => SignIn(),
        '/signup':(context) => SignUp(),
        '/main' : (context) => Mainpage()
      },
    );
  }
}
