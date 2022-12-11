import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _redcolor = Colors.red;
  Color _cyancolor = Colors.cyan;
  Color _blackcolor = Colors.black;
  Color _default = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Logo'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20,0),
                    width: 550.0,
                    height: 150.0,
                    color: _default,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20,0),
                    width: 130.0,
                    height: 130.0,
                    color: _default,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _default = _redcolor;
                        });
                      }, child: Text('Red')),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _default = _cyancolor;
                        });
                      }, child: Text('Cyan')),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          _default = _blackcolor;
                        });
                      }, child: Text('Black')),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}