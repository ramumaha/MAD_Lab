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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Robot'),
        ),
        body: Container(
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.green,
                    height: 80.0,
                    width: 30.0,
                    margin: EdgeInsets.fromLTRB(0,0,0,80),

                  ),
                  Container(
                    color: Colors.black,
                    height: 220.0,
                    width: 220.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                            ],),
                          Container(
                            color: Colors.red,
                            width: 170.0,
                            height: 30.0,
                          )
                        ]),
                  ),
                  Container(
                    color: Colors.green,
                    height: 80.0,
                    width: 30.0,
                    margin: EdgeInsets.fromLTRB(0,0,0,80),
                  )
                ],)
          ),
        ),
      ),
    );
  }
}