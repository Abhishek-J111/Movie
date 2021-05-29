import 'package:flutter/material.dart';
import '../Model/httpHelper.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  late var result;
  late HttpHelper helper;
 late int moviescount;
  late var movies;
  @override
  void initState(){
    super.initState();
    helper = HttpHelper();
    //  movies = helper.getUpcoming();
    // print(movies[1]);
    // setState(() {
    //   moviescount = movies.length;
    //   // movies = movies;
    // });
    // // print(moviescount);
    initialize();
    
  }
  // dart --no-sound-null-safety run
//  flutter run --no-sound-null-safety
  Future initialize() async {
    // var movies1 ;
    movies = await helper.getUpcoming();
    print(movies.length);
    print("Abhishek");
    setState(() {
      moviescount = movies.length;
      movies = movies;
    });
    // print(moviescount);
    // print(movies);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Movies'),

     ),
     body: ListView.builder(
       // ignore: unnecessary_null_comparison
       itemCount: moviescount,
       itemBuilder: (BuildContext context, int index){
         return Card(
           color: Colors.white,
           elevation: 2.0,
           child: ListTile(
            //  title: Text('Abhishek'),
             onTap:()=> helper.getUpcoming(),
             title: Text(movies[index].title),
             subtitle: Text('- Vote:'+movies[index].voteAverage.toString()),
           ),
         );
       }
       )
      
    );
  }
}