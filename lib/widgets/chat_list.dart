import 'package:chat_app/widgets/chat_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  final String userId;

  ChatListPage({required this.userId});

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var users = [
    {
      'name': 'Walid',
      'department': 'IT',
    },
    {'name': 'Asyraf', 'department': 'Finance'},
    {
      'name': 'Faiz',
      'department': 'Marketing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat List Page'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('user').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                final List<DocumentSnapshot> documents =
                    snapshot.requireData.docs;
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, position) {
                      if (documents[position]["id"] != widget.userId) {
                        return ListTile(
                          title: Text(documents[position]["email"]),
                        );
                      } else {
                        return Container();
                      }
                    });
              }
            }));
  }
}

// ListView.builder(
//     itemCount: users.length,
//     itemBuilder: (context,position){
//   return ListTile(
//     title: Text(users[position]['name']!),
//     subtitle: Text(users[position]['name']!),
//     trailing: Icon(Icons.arrow_forward_ios_rounded),
//     onTap: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage()));
//     },
//   );
// })
