import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class NotesViewsScreen extends StatefulWidget {

  static String id='notesview_screen';
  @override
  _NotesViewsScreenState createState() => _NotesViewsScreenState();
}

class _NotesViewsScreenState extends State<NotesViewsScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection(
      "users");

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  int _counter = 0;
  final fieldTextTitle = TextEditingController();
  final fieldTextDescription = TextEditingController();
  late String noteTitle="";
  late String noteDescription="";

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
  void clearText() {
    fieldTextTitle.clear();
    fieldTextDescription.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
          toolbarHeight: 60,
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // _auth.signOut();
                  // Fluttertoast.showToast(
                  //                   //     msg: "Saving it on the cloud!",
                  //                   //     toastLength: Toast.LENGTH_LONG,
                  //                   //     gravity: ToastGravity.CENTER,
                  //                   //     timeInSecForIosWeb: 1,
                  //                   //     backgroundColor: Colors.red,
                  //                   //     textColor: Colors.white,
                  //                   //     fontSize: 16.0
                  //                   // );
                  //                   // Navigator.pop(context);
                  //Implement logout functionality
                }),
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // _auth.signOut();
                  // Fluttertoast.showToast(
                  //     msg: "Saving it on the cloud!",
                  //     toastLength: Toast.LENGTH_LONG,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // );
                  // Navigator.pop(context);
                  //Implement logout functionality
                }),
          ],
          title: const Center(
            child:  Text(
              'Add your Notes Here!',
            ),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: kMessageContainerDecoration2,
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
                          //enter the title of the note and store in this field
                          noteTitle=value;
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
                        controller: fieldTextTitle,
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
                decoration: kMessageContainerDecoration2,
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: fieldTextDescription,
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (value) {
                          //enter the description of the note and store in this field
                          noteDescription=value;
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
          icon: Icons.delete,
          onPress: () {
                    Fluttertoast.showToast(
                        msg: "Note Deleted !!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
          },
          activeBackgroundColor: Colors.blueAccent,
          overlayColor: Colors.tealAccent,
          curve: Curves.bounceIn,

        )
    );
  }
}