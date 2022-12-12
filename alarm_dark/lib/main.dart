
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(const MyApp());
}

ThemeData _darktheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark
);
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:_darktheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter alarm clock example'),
        ),

        body: Center(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: hourController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hour',
                    hintText: 'enter in 24 format',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: minuteController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Minute',
                    hintText: 'Enter in 60 format',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create alarm',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.createAlarm(int.parse(hourController.text), int.parse(minuteController.text));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Show alarms',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.showAlarms();
                  },
                ),
              ),
            ])),
      ),
    );
  }
}