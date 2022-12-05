import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  static const String _title= 'Flutter Sample';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      title:_title,
      home:StatefulShapes(),
    );
  }
}

class StatefulShapes extends StatefulWidget {
  const StatefulShapes({Key? key}) : super(key: key);

  @override
  State<StatefulShapes> createState() => _StatefulShapesState();
}

class _StatefulShapesState extends State<StatefulShapes> {
  int _selectedIndex=0;
  static const List<Widget> _widgetOptions=<Widget>[
    CustomPaint(
      size:Size(300,200),
      painter: LinePainter(),
    ),

    CustomPaint(
      size:Size(300,200),
      painter: CirclePainter(),
    ),

    CustomPaint(
      size:Size(300,200),
      painter: TrianglePainter(),
    )
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:const Text("Custom Paint Demo"),
        ),
      body:Center(
        child:_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.horizontal_rule),
              label:'Line'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label:'Circle'),
          BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
              label:'Triangle'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}






class LinePainter extends  CustomPainter {

  const LinePainter() ;
  @override
  void paint(Canvas canvas,Size size){
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;
      
      Offset start=Offset(0,size.height/2);
      Offset end=Offset(size.width,size.height/2);
      canvas.drawLine(start,end,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
 
  
}

class CirclePainter extends CustomPainter{
  const CirclePainter() ;
  @override
  void paint(Canvas canvas,Size size){
    var paint=Paint()
        ..color=Colors.teal
        ..strokeWidth=5
        ..style=PaintingStyle.stroke
        ..strokeCap=StrokeCap.round;
    Offset center=Offset(size.width/2,size.height/2);
    canvas.drawCircle(center,100,paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;

  }
}

class TrianglePainter extends CustomPainter{
  const TrianglePainter() ;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint=Paint()
        ..color=Colors.teal
        ..strokeWidth=5
        ..style=PaintingStyle.stroke
        ..strokeCap=StrokeCap.round;
    var path=Path();
    var angle=(math.pi *2)/3;
    var radius=100;
    Offset center=Offset(size.width/2,size.height/2);
    Offset startPoint=Offset(radius*math.cos(0.0),radius*math.sin(0.0));
    path.moveTo(startPoint.dx+center.dx,startPoint.dy+center.dy);
    for(int i=1;i<=3;i++){
      double x=radius*math.cos(angle*i)+center.dx;
      double y=radius*math.sin(angle*i)+center.dy;
      path.lineTo(x,y);
    }
    path.close();
    canvas.drawPath(path,paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}