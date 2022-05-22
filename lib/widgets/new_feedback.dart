import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewFeedback extends StatefulWidget {
  @override
  _NewFeedbackState createState() => _NewFeedbackState();
}

class _NewFeedbackState extends State<NewFeedback> {
  final _textController = new TextEditingController();
  var _enteredText = '';

  void _sendFeedback() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('feedbacks').add({
      'text': _enteredText,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 450,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Write a feedback about this app.',
            ),
            controller: _textController,
            onChanged: (value) {
              setState(() {
                _enteredText = value;
              });
            },
          ),
          ElevatedButton(
            child: Text(
              'Send Feedback',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: _enteredText.trim().isEmpty ? null : _sendFeedback,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
