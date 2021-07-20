import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/registration_screen.dart';
import 'package:todoapp/components/rounded_button.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id= 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//ticker provider for multiple
//single ticker for only one animation in this page
class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState(){
    super.initState();
    controller=AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );


    animation= CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate);


    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag:'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: controller.value*120,
                  ),
                ),
                TextLiquidFill(
                  text: 'Todo App',
                  waveColor: Colors.blueAccent,
                  boxBackgroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                  boxHeight: 75,
                  boxWidth: 240,
                  // style: TextStyle(
                  //   fontSize: controller.value*45,
                  //   fontWeight: FontWeight.w900,
                  // ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 60.0,
                  child: const Text(
                      'Log In',
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.lightBlue,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 60.0,
                  child: const Text(
                      'Register',
                      style: TextStyle(
                      fontSize: 30
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

