import 'package:flutter/material.dart';
import 'package:learn_http/repository/repository.dart';
import 'package:learn_http/servise/local_database.dart';

void main() async{

  await LocalStrage().getInstance();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: LessonRepository.getListData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return Center(child:SingleChildScrollView(
              child: Column(
                children: List.generate(snapshot.data?.length??0,
                        (index) => Column(
                          children: [
                            Text(snapshot.data?[index]['title'].toString()??""),
                            Text(snapshot.data?[index]['category'].toString()??""),
                            Text(snapshot.data?[index]['description'].toString()??""),
                            Text(snapshot.data?[index]['price'].toString()??""),
                        
                        
                        
                            Image.network(snapshot.data?[index]["image"]??"",height: 200,width: 200,)
                          ],
                        ))
              ),
            ));
          }
          if (snapshot.hasError) {
            return Center(child: const Text("Data eror"));
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
