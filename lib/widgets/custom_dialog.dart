import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    this.titleFed,
    this.contentChild,
    this.actionFed,
  }) : super(key: key);

  final String titleFed;
  final Widget contentChild;
  final Widget actionFed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(40),
      )),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
      title: Text(
        titleFed,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Container(child: contentChild),
      actions: [actionFed],
    );
  }
}
