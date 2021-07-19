import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recovery Password Page'),),
        body: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'Enter Email Address'),),
            TextButton(onPressed: (){},
              child: Text('Login'),
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent, primary: Colors.white),),
          ],
        )
    );
  }
}
