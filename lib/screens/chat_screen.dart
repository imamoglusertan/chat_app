import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/new_feedback.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';
import '../widgets/custom_dialog.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          titleFed: 'Send a Feedback',
          contentChild: NewFeedback(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        elevation: 0,
        actions: [
          DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Change the Theme Color'),
                    ],
                  ),
                  value: 'color',
                ),
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Change Background Image'),
                    ],
                  ),
                  value: 'wallpaper',
                ),
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Send Feedback'),
                    ],
                  ),
                  value: 'feedback',
                ),
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('Log Out'),
                    ],
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                } else if (itemIdentifier == 'color') {
                } else if (itemIdentifier == 'wallpaper') {
                } else if (itemIdentifier == 'feedback') {
                  _showDialog();
                }
              })
        ],
      ),

      /*body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),*/

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
