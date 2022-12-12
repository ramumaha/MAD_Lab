import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SD Card",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Writing to SD Card",
          ),
          centerTitle: true,
        ),
        body: const WriteToCard(),
      ),
    );
  }
}

class WriteToCard extends StatefulWidget {

  const WriteToCard({Key? key}) : super(key: key);

  @override
  State<WriteToCard> createState() => _WriteToCardState();
}

class _WriteToCardState extends State<WriteToCard> {
  String filename = "";

  String fileContent = "";


  Future<File> requestAndWrite() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage,
    ].request();
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    return writeToFile();
  }

  Future<File> writeToFile() async {
    List<String> paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStorageDirectories();

    // List<FileSystemEntity> list_ = io.Directory(paths[1]).listSync();
    // print(list_);
    File counterFile = File('${paths[1]}/$filename');
    counterFile = await counterFile.create();
    return counterFile.writeAsString(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Column(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "filename.ext",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      )
                  ),
                  onChanged: (text) {
                    filename = text;
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter content (keep it short! :))",
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  maxLines: null,
                  onChanged: (text) {
                    fileContent = text;
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                onPressed: () async {
                  File file = await requestAndWrite();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Write Successful!"),
                        );
                      }
                  );
                },
                child: const Text(
                  "Write to Card",
                ),
              ),
            ]
        ),
      ),
    );
  }
}