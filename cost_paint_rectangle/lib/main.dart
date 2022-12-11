import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
double _height=0.0;
double _width=0.0;
double _ans=0.0;
bool _clicked = false;
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140.0,
                width: 180.0,
                color: (_clicked == true )?Colors.amber:Colors.red,
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_clicked == false)
                      {_clicked = true;}
                      else{
                        _clicked = false;
                      }
                    });
                  },
                  child: Text(
                      'Change Color'
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Height',
                      ),
                      onChanged: (val){
                        setState(() {
                          _height=double.parse(val);
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Width'
                      ),
                      onChanged: (val){
                        setState(() {
                          _width= double.parse(val);
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _ans=2*(_height*_width);
                    });
                  },
                  child: Text('Calculate')),
              Container(
                color: Colors.amber,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(20.0),
                child: Text(
                    '$_ans'
                ),
              )
            ],
          )
      ),
    );
  }
}