import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool servicesstatus=false;
  bool haspermission=false;
  late LocationPermission permission;
  late Position position;
  String long="",lat="";

  @override
  void initState(){
    checkGps();
    super.initState();
  }

  checkGps() async{
    servicesstatus=await Geolocator.isLocationServiceEnabled();
    if(servicesstatus){
      permission=await Geolocator.checkPermission();
      if(permission==LocationPermission.denied){
          permission=await Geolocator.requestPermission();
          if(permission==LocationPermission.denied){
            print("location permission denied");
          }else if(permission==LocationPermission.deniedForever){
            print("Permission denied permentently");}
          }else{
            haspermission=true;
          }
          if(haspermission){
            setState(() {
              //refresh the UI;
            });
            geoLocation();}
          }else{
            print("GPS location not enabled,turn on gps location");
          }
          setState(() {
            //refresh UI
          });
    }

    geoLocation() async {
    position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    long=position.longitude.toString();
    lat=position.latitude.toString();
    setState(() {
      //refresh UI
    });
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100,
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
           });
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('GPS location'),
        backgroundColor: Colors.redAccent,
      ),
      body:Container(
        alignment:Alignment.center,
        padding: EdgeInsets.all(50),
        child:Column(
          children:[
            Text(servicesstatus?"GPS enabled":"GPS disabled"),
            Text(haspermission?"GSP permission granted":"GPS permission not granted"),
            Text("Longitute:$long",style:TextStyle(fontSize: 20)),
            Text("latitude:$lat",style:TextStyle(fontSize:20),)

          ]
        )
      )
    );
  }
}
