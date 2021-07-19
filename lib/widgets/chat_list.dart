import 'package:chat_app/widgets/chat_detail.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var users = [
    {'name': 'Walid', 'department':'IT',},
    {'name': 'Asyraf', 'department': 'Finance'},
    {'name': 'Faiz', 'department':'Marketing',},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat List Page'),),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,position){
        return ListTile(
          title: Text(users[position]['name']!),
          subtitle: Text(users[position]['name']!),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage()));
          },
        );
      })

    );
  }
}
