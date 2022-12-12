import 'package:flutter/material.dart';
import 'package:user_authentication/model.dart';
import 'package:user_authentication/services.dart';
import 'package:user_authentication/success.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),

    );
  }
}


class MyHomePage extends StatefulWidget {


  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  late DataBase handler;
  Future<int> addPlanets() async {
    Logins first_login=
        Logins(username:'ramu',password:'ramu');
    Logins second_login=
        Logins(username:'kanya',password:'kanya');

    List<Logins>logins=[first_login,second_login];
    return await handler.insertPlanets(logins);

  }
  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      await addPlanets();
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Login')
        ),
        body:

        Column(
            children: <Widget>[TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter name',
                  hintText: 'Enter name'
              ),

            ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter password',
                    hintText: 'Enter password'
                ),

              ),
              TextButton.icon(
                  label: Text('Login'),
                  icon: Icon(Icons.login),
                  onPressed: () async {
                   int? count=await handler.queryRows(nameController.text);
                   if(count==0){
                     ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Invalid')),
                     );


                   }else{
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Success()));

                   }
                  }
              ),

            ]
        )
    );
  }
}
