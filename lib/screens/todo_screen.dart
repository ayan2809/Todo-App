import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/constants.dart';

import 'notes_screen.dart';

class TodoScreen extends StatefulWidget {
  static String id='todo_screen';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  int _counter = 0;

  @override
  void initState()
  {
    getCurrentUser();
    super.initState();
  }
  void getCurrentUser() async
  {
    try{
      final user= await _auth.currentUser;
      if(user!=null)
      {
        loggedInUser=user;
        print(loggedInUser.email);
      }
    }
    catch(e)
    {
      print(e);
    }

  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Fluttertoast.showToast(
                    msg: "We are sorry to see you go!",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: const Text('Todo App'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     //Implement send functionality.
                  //   },
                  //   child: const Text(
                  //     'Send',
                  //     style: kSendButtonTextStyle,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        activeBackgroundColor: Colors.blueAccent,
        overlayColor: Colors.tealAccent,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.notes),
            label: "Descriptive Notes",
            backgroundColor: Colors.cyanAccent,
            onTap: () {
              Navigator.pushNamed(context, NotesScreen.id);
            },
          ),
          SpeedDialChild(
              child: const Icon(Icons.schedule),
              label: "Notes Scheduler",
              backgroundColor: Colors.cyanAccent,
              onTap: () => print("Second!")
          ),
          SpeedDialChild(
              child: const Icon(Icons.audiotrack),
              label: "Audio Notes",
              backgroundColor: Colors.cyanAccent,
              onTap: () => print("Third!")
          ),
          SpeedDialChild(
              child: const Icon(Icons.photo),
              label: "Image Notes",
              backgroundColor: Colors.cyanAccent,
              onTap: () => print("Fourth!")
          ),
        ],


            // child: FloatingActionButton(
            //   onPressed: _incrementCounter,
            //   tooltip: 'Increment',
              //child: animatedIcon
            // ),
        //
        // ),
      )
    );
  }
}

