import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ID Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      print(lat);

      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.black,
            child: Card(
              color: Color.fromARGB(255, 1, 9, 121),
              margin: EdgeInsets.all(9.0),
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Image.network('https://www.emmegi.co.uk/wp-content/uploads/2019/01/User-Icon.jpg'),
                      height: 180.0,
                    ),
                    Divider(
                      height: 25.0,
                      color: Colors.white,

                    ),
                    Text('JOHN',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    ),
                    Text('1950020xx',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                    Text('IT Department',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Text('SSNCE',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    ),
                    Text('Location',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                      ),

                    ),
                Text('Latitute : $lat',
                style: TextStyle(
                    letterSpacing: 4.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.white
                ),
                ),
                    Text('Longitude :$long',
                      style: TextStyle(
                          letterSpacing: 4.0,
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                      ),
                    )

                  ]) ,
            ),
          )
      ),
    );
  }
}