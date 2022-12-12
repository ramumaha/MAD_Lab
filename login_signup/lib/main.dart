import 'package:flutter/material.dart';
import 'package:login_signup/login.dart';
import 'package:login_signup/service.dart';
import 'package:login_signup/model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late DataBase handler;

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          centerTitle: true,
        ),
      body:Center(
    child: Container(
    margin: EdgeInsets.all(30.0),
    child: Card(
    margin: EdgeInsets.all(9.0),
    child:Column(
    children: [
    Container(
    margin: EdgeInsets.all(5.0),
    child: Image.network('https://www.emmegi.co.uk/wp-content/uploads/2019/01/User-Icon.jpg'),
    height: 180.0,
    ),
    Divider(
    height: 25.0,
    // color: Colors.white,

    ),
      Padding(
        padding: EdgeInsets.all(15),
        child: TextField(
          controller: usernameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
            hintText: 'enter username',
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: TextField(
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter password',
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(25),
        child: TextButton(
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () async {
           Logins first_login=
           Logins(username:usernameController.text,password:passwordController.text);
           List<Logins>logins=[first_login];
           await handler.insertPlanets(logins);
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('User Registered')),
           );
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login_()));


          },
        ),
      ),
    ]),
      )


    ),
      )
    );

  }
}

