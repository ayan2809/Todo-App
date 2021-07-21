import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kMessageContainerDecoration2 = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white, width: 0.0),
  ),
);

const kMessageContainerDecoration3 = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    left: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    right: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    bottom: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);