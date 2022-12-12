import 'package:flutter/material.dart';
import 'package:telephone_directory/model.dart';
import 'package:telephone_directory/service.dart';
import 'package:telephone_directory/list.dart';


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
  // final idController = TextEditingController();
  // final nameController = TextEditingController();
  // final numberController = TextEditingController();
  //
  //
  //
  // late DataBase handler;
  // Future<int> addPlanets() async {
  //   Planets firstPlanet =
  //   Planets(id:1,name: "Mercury", phone_number: 9245448121);
  //   Planets secondPlanet =
  //   Planets(id:2,name: "Venus", phone_number: 9245448122 );
  //   Planets thirdPlanet =
  //   Planets(id: 3, name: 'Earth', phone_number: 9245448125,);
  //   Planets fourthPlanet =
  //   Planets(id: 4, name: 'Mars', phone_number: 9245448120);
  //
  //   List<Planets> planets = [firstPlanet, secondPlanet,thirdPlanet,fourthPlanet];
  //   return await handler.insertPlanets(planets);
  // }


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
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  late DataBase handler;
  Future<int> addPlanets() async {
    Planets firstPlanet =
    Planets(id:1,name: "Mercury", phone_number: 9245448121);
    Planets secondPlanet =
    Planets(id:2,name: "Venus", phone_number: 9245448122 );
    Planets thirdPlanet =
    Planets(id: 3, name: 'Earth', phone_number: 9245448125,);
    Planets fourthPlanet =
    Planets(id: 4, name: 'Mars', phone_number: 9245448120);

    List<Planets> planets = [firstPlanet, secondPlanet,thirdPlanet,fourthPlanet];
    return await handler.insertPlanets(planets);
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
        title:Text('Add numbers')
      ),
      body:

             Column(
               children: <Widget>[TextField (
                controller: idController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter ID',
                    hintText: 'Enter Your ID'
                ),

      ),
                 TextField (
                     controller: nameController,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       labelText: 'Enter Name',
                       hintText: 'Enter Your Name'
                   ),

                 ),
                 TextField (
                     controller: numberController,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       labelText: 'Phone_number',
                       hintText: '9 digit'
                   ),

                 ),
                 TextButton.icon(
                     label: Text('Add me'),
                     icon: Icon(Icons.add),
                     onPressed: () async {
                       Planets newPlanet =
                       Planets(id:int.parse(idController.text),name: nameController.text, phone_number: int.parse(numberController.text));
                       List<Planets> planets = [newPlanet];
                       await handler.insertPlanets(planets);
                     }
                 ),
                 TextButton.icon(
                     label: Text('View Records'),
                     icon: Icon(Icons.view_agenda),
                     onPressed: () async {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>List_()));

                     }
                 )
               ]
             ),





    );
  }
}
