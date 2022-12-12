import 'package:flutter/material.dart';
import 'package:telephone_directory/model.dart';
import 'package:telephone_directory/service.dart';

class List_ extends StatefulWidget {

   List_({Key? key}) : super(key: key);
   late DataBase handler;

  @override
  State<List_> createState() => _ListState();
}

class _ListState extends State<List_> {
  late DataBase handler;
  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {

      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: handler.retrievePlanets(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Planets>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].phone_number.toString()),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}






