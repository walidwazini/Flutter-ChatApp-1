import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_list.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  var messages = [
    {'from':'Walid', 'dt': '15/07/20201', 'time' : '20:14', 'message': 'Sir saya nak amek project tu.'},
    {'from':'Sir Muz', 'dt': '15/07/20201', 'time' : '20:30', 'message': 'Nice, nanti saya kasi details'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatDetail Page'),),
      body: Column(
        children: [
          Row(
            children: [
              TextField(decoration: InputDecoration(hintText: 'EnterMessage'),),
              TextButton(onPressed: (){}, child: Text('Send')),
            ],
          ),
          Expanded(child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context,position){
            return ListTile(
              title: Text(messages[position]['message']!),
              subtitle: Text(messages[position]['from']!),
            );
          }))
        ],
      )
    );
  }
}
