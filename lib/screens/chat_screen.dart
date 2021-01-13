import 'package:SayHi/widgets/create_message_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Thusanth'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              )
            ],
            onChanged: (item) {
              if (item == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/leaf.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('chat')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (ctx, streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final documents = streamSnapshot.data.documents;
                  return ListView.builder(
                    reverse: true,
                    itemCount: documents.length,
                    itemBuilder: (ctx, index) => Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          width: 150,
                          child: Text(
                            documents[index]['text'],
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CreateNewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection('chat')
      //         .add({'text': 'Pressed Add Button'});
      //   },
      // ),
    );
  }
}
