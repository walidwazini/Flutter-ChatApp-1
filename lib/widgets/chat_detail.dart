import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatDetailPage extends StatefulWidget {
  final String receiverId;
  final String senderId;

  ChatDetailPage({required this.senderId, required this.receiverId});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  var messages = [
    {
      'from': 'Walid',
      'dt': '15/07/20201',
      'time': '20:14',
      'message': 'Sir saya nak amek project tu.'
    },
    {
      'from': 'Sir Muz',
      'dt': '15/07/20201',
      'time': '20:30',
      'message': 'Nice, nanti saya kasi details'
    },
  ];

  var channelId = '';
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 1) We create conversation Id
    if (widget.senderId.hashCode < widget.receiverId.hashCode) {
      channelId = '${widget.senderId}-${widget.receiverId}';
    } else {
      channelId = '${widget.receiverId} - ${widget.senderId}';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('ChatDetail Page'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'EnterMessage'),
                    controller: messageController,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('message')
                          .doc(channelId)
                          .collection(channelId)
                          .doc(DateTime.now().millisecondsSinceEpoch.toString())
                          .set({
                        'idFrom': widget.senderId,
                        'idTo': widget.receiverId,
                        'timeStamp':
                            DateTime.now().microsecondsSinceEpoch.toString(),
                        'content': messageController.text
                      });
                    },
                    child: Text('Send')),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('message')
                  .doc(channelId)
                  .collection(channelId)
                  .snapshots(),
              builder: (context, snapshots) {
                if (!snapshots.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: snapshots.requireData.docs.length,
                      itemBuilder: (context, position) {
                        return ListTile(
                          title: Text(
                              snapshots.requireData.docs[position]['idFrom']),
                          subtitle: Text(
                              snapshots.requireData.docs[position]['content']),
                        );
                      });
                }
              },
            )),
          ],
        ));
  }
}

// ListView.builder(
// itemCount: messages.length,
// itemBuilder: (context, position) {
// return ListTile(
// title: Text(messages[position]['message']!),
// subtitle: Text(messages[position]['from']!),
// );
// })
