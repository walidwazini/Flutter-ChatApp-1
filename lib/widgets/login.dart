import 'package:chat_app/widgets/chat_list.dart';
import 'package:chat_app/widgets/forgot_password.dart';
import 'package:chat_app/widgets/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({Key? key}) : super(key: key);
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: emailEditingController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: passwordEditingController,
              obscureText: true,
            ),
            TextButton(
              onPressed: () async {
                User? user = (await _auth.signInWithEmailAndPassword(
                    email: emailEditingController.text,
                    password: passwordEditingController.text)).user;
                if (user != null){
                  print("Succesful login");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatListPage()));

                }
                else{
                  print('Error');
                }
              },
              child: Text('Login'),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  primary: Colors.white),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text("Sign up"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: Text("Forgot Password"),
                ),
              ],
            ),
          ],
        ));
  }
}
