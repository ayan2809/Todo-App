import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/screens/todo_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth =FirebaseAuth.instance;
  late String email;
  late String password;
  late bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag:'logo',
                child: SizedBox(
                  height: 225.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                keyboardType:  TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your password.',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: ()  async {
                      setState(() {
                        showSpinner=true;
                      });
                      try{

                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if(user!=null)
                        {
                          Navigator.pushNamed(context, TodoScreen.id);
                          Fluttertoast.showToast(
                              msg: "Whalecum to the TODO app",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        setState(() {
                          showSpinner=false;
                        });
                      }
                      catch(e)
                      {
                         print(e);
                         Fluttertoast.showToast(
                             msg: "Password or User ID invalid",
                             toastLength: Toast.LENGTH_LONG,
                             gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                             backgroundColor: Colors.red,
                             textColor: Colors.white,
                             fontSize: 16.0
                         );
                      }

                      //Implement login functionality.
                    },
                    minWidth: 200.0,
                    height: 60.0,
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}