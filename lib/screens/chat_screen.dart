import 'package:SayHi/widgets/create_message_widget.dart';
import 'package:SayHi/widgets/message_box_widget.dart';
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
              child: FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (ctx, futureSnapshot) {
                  if (futureSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return StreamBuilder(
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
                          itemBuilder: (ctx, index) => MessageBox(
                            messageText: documents[index]['text'],
                            isMe: documents[index]['userId'] ==
                                futureSnapshot.data.uid,
                            key: ValueKey(
                              documents[index].documentID,
                            ),
                          ),
                        );
                      });
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
