import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({Key? key, String userId}) : super(key: key);
  final String userId;
  ProfilePage({required this.userId});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: 'Name'),),
          TextField(decoration: InputDecoration(hintText: 'Email'),),
          TextField(decoration: InputDecoration(hintText: 'Phone number'),),
          TextField(decoration: InputDecoration(hintText: 'Address'),),
          TextField(decoration: InputDecoration(hintText: 'Info'),),
        ],
      ),
    );

  }

  void retrieveUserInfo() async {
    FirebaseFirestore.instance.collection('user').doc(widget.userId).get().then((ds) {
      print('check');
      print(ds.data());
      if(ds.exists) {

        setState(() {
          nameController.text = ds.data()!['name'];
          emailController.text = ds.data()!['email'];
          phoneController.text = ds.data()!['phone'];
        });
      }
    });
  }
}
