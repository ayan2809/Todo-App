import 'package:flutter/material.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/registration_screen.dart';
import 'package:todoapp/screens/todo_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {final ThemeData theme = Theme.of(context);
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: theme.textTheme.copyWith(
      //     headline6: theme.textTheme.headline6!.copyWith(
      //       color: Colors.black54,
      //     ),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id :(context)=>WelcomeScreen(),
        LoginScreen.id :(context)=>LoginScreen(),
        RegistrationScreen.id :(context)=>RegistrationScreen(),
        TodoScreen.id :(context)=>TodoScreen(),
      },
    );
  }
}