import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  // const ForgotPasswordPage({Key? key}) : super(key: key);


  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var emailController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recovery Password Page'),),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter Email Address'),
              controller: emailController,),
            TextButton(onPressed: () async {
              await _auth.sendPasswordResetEmail(email:emailController.text)
              .then((value) => print('Succesful!'))
              .catchError((err) => print(err));
            },

              child: Text('Login'),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  primary: Colors.white),),
          ],
        )
    );
  }
}
