import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatelessWidget {
  // const RegisterPage({Key? key}) : super(key: key);
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 40, 50, 10),
          child: Column(
            children: [
              TextField(
                controller: emailEditingController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: passwordEditingController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              // TextField(decoration: InputDecoration(hintText: 'Email'),),
              // TextField(decoration: InputDecoration(hintText: 'Password'), obscureText: true,),
              SizedBox(height: 30,),
              TextButton(
                onPressed: () async {
                  User? user = (await _auth.createUserWithEmailAndPassword(
                    email: emailEditingController.text.trim(),
                    password: passwordEditingController.text,
                  )).user;
                  if (user != null) {
                    print("Succesfully registered");
                    FirebaseFirestore.instance.collection('user').doc(user.uid).set({
                      'email' : user.email,
                      'id' : user.uid,
                      'createAt' : DateTime.now(),
                      'chattingWith' : null,
                    });
                  } else {
                    print("Something is wrong!");
                  }
                },
                child: Text('Register'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    primary: Colors.white),
              ),
            ],
          ),
        ));
    ;
  }
}
