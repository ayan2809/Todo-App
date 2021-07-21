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
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                      child:MyStatelessWidget(),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20.0,
            ),
            Container(
              decoration: kMessageContainerDecoration2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child:MyStatelessWidget(),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20.0,
            ),
            Container(
              decoration: kMessageContainerDecoration2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child:MyStatelessWidget(),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20.0,
            ),
            Container(
              decoration: kMessageContainerDecoration2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child:MyStatelessWidget(),
                  ),
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

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               leading: Icon(Icons.album),
//               title: Text('The Enchanted Nightingale'),
//               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.blue.shade50,
        elevation: 15.0,
        child: Column(
          children: <Widget>[
            InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped');
               },
              child: Column(
                children: <Widget> [
                   const SizedBox(
                      width: 350,
                      height: 30,
                      child : Text(
                          'Title',

                      ),
                  ),
                  const SizedBox(
                    width: 350,
                    height: 100,
                    child : const Text(
                        'Title'
                    ),
                  ),
                ],

              ),
              ),
          ],
        ),
      ),
    );
  }
}