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
  var addressController = TextEditingController();

  @override
  void initState() {
    // TODO implement init state
    super.initState();
    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Name'),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            // Avoid user to change email by themself, need to do authentication
            enabled: false,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Phone number'),
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Address'),
            controller: addressController,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('user')
                    .doc(widget.userId)
                    .update({
                  'name': nameController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                  'address': addressController.text,
                });
              },
              child: Text('Update Info')),
        ],
      ),
    );
  }

  void retrieveUserInfo() async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(widget.userId)
        .get()
        .then((ds) {
      print('check');
      print(ds.data());
      if (ds.exists) {
        setState(() {
          nameController.text = ds.data()!['name'];
          emailController.text = ds.data()!['email'];
          phoneController.text = ds.data()!['phone'];
        });
      }
    });
  }
}
