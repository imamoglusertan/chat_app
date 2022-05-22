import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
  });

  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isMe
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        isMe ? Radius.circular(20.0) : Radius.circular(10.0),
                    bottomRight:
                        isMe ? Radius.circular(10.0) : Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              width: 140,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      // Theme.of(context).accentTextTheme.headline1.color,
                    ),
                    textAlign: isMe ? TextAlign.right : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
