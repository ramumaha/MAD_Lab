import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   String? _data;
   @override
   void initState() {
     super.initState();
     writeContent();
     readContent().then((String value) {
       setState(() {
         _data = value;
       });
     });
   }

   Future<String?> get _localPath async {
     final directory = await getExternalStorageDirectory();
     print(directory?.path);
     return directory?.path;
   }
   Future<File> get _localFile async {
     final path = await _localPath;
     return File('$path/counter.txt');
   }

   Future<String> readContent() async {
     try {
       final file = await _localFile;
       // Read the file
       String contents = await file.readAsString();
       // Returning the contents of the file
       return contents;
     } catch (e) {
       // If encountering an error, return
       return 'Error!';
     }
   }

   Future<File> writeContent() async {
     final file = await _localFile;
     // Write the file
     return file.writeAsString('Hello from the otherside');   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Reading and Writing data')),
      body:Center(
        child:Text(
          'Data read from a file:\n$_data',
        )
      )
    );
  }
}

