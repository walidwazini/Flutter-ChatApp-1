import 'package:chat_app/widgets/chat_list.dart';
import 'package:chat_app/widgets/forgot_password.dart';
import 'package:chat_app/widgets/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatListPage()));
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
