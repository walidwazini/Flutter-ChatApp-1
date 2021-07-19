import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register Page'),),
        body: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'Email'),),
            TextField(decoration: InputDecoration(hintText: 'Password'), obscureText: true,),
            TextButton(onPressed: (){},
              child: Text('Register'),
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent, primary: Colors.white),),
          ],
        )

    );;
  }
}
