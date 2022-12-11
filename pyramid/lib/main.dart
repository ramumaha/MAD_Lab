import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark
      ),
      home: const MyHomePage(title: 'Build Pyramid'),
    );
  }
}
String stars="";
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
int _n=0;
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter N'
                    ),
                    onChanged: (val){
                      setState(() {
                        _n=int.parse(val);
                      });
                    }
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      buildStars(_n);
                    });
                  },
                  child: Text('Build')),
              SizedBox(height: 100),
              Text(stars),
            ],)
      ),
    );
  }
  void buildStars(int n) {
    stars = "";
    if (n > 11 && n < 0)
      // if input is not but between 1 and 10
      stars = "Enter value between 1 and 10";
    else {
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i - 1; j++) {
          // adding blank spaces to string
          stars += " ";
        }
        for (int k = 0; k < i + 1; k++) {
          stars += "* ";
        }
        stars += "\n";
      }
    }
  }
}