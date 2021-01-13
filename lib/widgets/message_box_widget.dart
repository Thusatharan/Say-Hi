import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final String messageText;
  final bool isMe;
  final Key key;

  MessageBox({
    this.messageText,
    this.isMe,
    this.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).primaryColorDark : Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
            ),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          width: 150,
          child: Text(
            messageText,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
