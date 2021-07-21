import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class NotesScreen extends StatefulWidget {
  static String id='notes_screen';
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

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
       resizeToAvoidBottomInset:false,
        appBar: AppBar(
          toolbarHeight: 50,
          leading: null,
          // actions: <Widget>[
          //   // IconButton(
          //   //     icon: const Icon(Icons.logout),
          //   //     onPressed: () {
          //   //       // _auth.signOut();
          //   //       Fluttertoast.showToast(
          //   //           msg: "Saving it on the cloud!",
          //   //           toastLength: Toast.LENGTH_LONG,
          //   //           gravity: ToastGravity.CENTER,
          //   //           timeInSecForIosWeb: 1,
          //   //           backgroundColor: Colors.red,
          //   //           textColor: Colors.white,
          //   //           fontSize: 16.0
          //   //       );
          //   //       Navigator.pop(context);
          //   //       //Implement logout functionality
          //   //     }),
          // ],
          title: const Center(
            child:  Text(
                'Add your Notes Here!',
            ),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: kMessageContainerDecoration,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            //expands: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                  fontSize: 23,
                                color: Colors.teal,
                              ),
                              hintText: 'Title',
                            ),
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
                Container(
                  height: 400,
                  decoration: kMessageContainerDecoration,
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          style: const TextStyle(
                            fontSize: 23
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.teal,
                            ),
                            hintText: 'Add Your Description Here!',
                          ),
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
          animatedIcon: AnimatedIcons.add_event,
          activeBackgroundColor: Colors.blueAccent,
          overlayColor: Colors.tealAccent,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.save),
                label: "Save!",
                backgroundColor: Colors.cyanAccent,
                onTap: () => print("First!")
            ),
            SpeedDialChild(
                child: const Icon(Icons.clear),
                label: "Clear!",
                backgroundColor: Colors.cyanAccent,
                onTap: () => print("First!")
            ),
          ],
        )
    );
  }
}