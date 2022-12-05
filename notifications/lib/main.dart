import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      ),
      home: const NotificationApp(),
    );
  }
}

class NotificationApp extends StatefulWidget {
  const NotificationApp({Key? key}) : super(key: key);

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}
class _NotificationAppState extends State<NotificationApp> {
//local notification object

late FlutterLocalNotificationsPlugin localNotifaction;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    var andriodInitialize =new AndroidInitializationSettings('ic_launcher');
    var initialzationSettings=new InitializationSettings(android: andriodInitialize);
    localNotifaction=FlutterLocalNotificationsPlugin();
    localNotifaction.initialize(initialzationSettings);
  }

  Future _showNotification() async{
    AndroidNotificationDetails _androidNotificationDetails =
    const AndroidNotificationDetails(
      'channel ID',
      'channel name',
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
    );
   var generalNotificationDetails=new NotificationDetails(android:_androidNotificationDetails);
   await localNotifaction.show(0,'Alert!!!!',"You have been alerted",generalNotificationDetails);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const Center(
        child:Text("Click the button to get notification"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNotification,
        child:const Icon(Icons.notification_add_rounded)
      ),
    );
  }
}
