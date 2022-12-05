import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;


  const Success(
      {Key? key, required this.name,
        required this.email,
        required this.password,
        required this.phoneNumber
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('The data stored')),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(name),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(email),
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text(password),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text(phoneNumber),
          ),
        ],
      ),
    );
  }
}
