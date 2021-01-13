import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CreateNewMessage extends StatefulWidget {
  @override
  _CreateNewMessageState createState() => _CreateNewMessageState();
}

class _CreateNewMessageState extends State<CreateNewMessage> {
  var _newMessage = '';
  final _textController = TextEditingController();

  void _sendText() {
    FocusScope.of(context).unfocus();
    Firestore.instance.collection('chat').add(
      {
        'text': _newMessage,
        'createdAt': Timestamp.now(),
      },
    );
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: _textController,
                cursorWidth: 1,
                cursorHeight: 20,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    fillColor: Colors.yellow,
                    hintText: 'Type Message',
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                onChanged: (value) {
                  setState(() {
                    _newMessage = value;
                  });
                },
              ),
            ),
          ),
          IconButton(
              color: Theme.of(context).primaryColorDark,
              icon: Icon(
                Icons.send_rounded,
                size: 30,
              ),
              onPressed: _newMessage.trim().isEmpty ? null : _sendText),
        ],
      ),
    );
  }
}
