import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/Model/movies.dart';
import '../Model/httpHelper.dart';
import 'moviedetails.dart';
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
    initialize();
    
  }
  Future initialize() async {
    movies = await helper.getUpcoming();
    print(movies.length);
    print("Abhishek");
    setState(() {
      moviescount = movies.length;
      movies = movies;
    });
  }
  @override
  Widget build(BuildContext context) {
    NetworkImage image;
   return Scaffold(
     backgroundColor: Color(0xfff0f0f0),
     body: SafeArea(
            child: SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                         color:Colors.lightBlue.shade700,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
                      ),
                      width: double.infinity,
                     
                      height: 145,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align( alignment: Alignment.centerRight,child: Text('Movies',style: TextStyle(fontSize: 24.0,letterSpacing: 0.2,color: Colors.white70),textAlign: TextAlign.center)),
                            
                           
                          ],
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 120,left: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white
                          ),
                          height: 50.0,
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                  Icon(Icons.search,size: 20.0,color: Colors.grey,),
                                  // TextField(
                                  //   decoration: InputDecoration(
                                  //     hintText: 'Search Movie',

                                  //   ),
                                  //   // autofocus: true,
                                  //   // autocorrect: true,

                                  // )
                              ],
                            ),
                          ),
                          // color: Colors.white,
                        ),
                      ),
                    
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top:158),
                        child: ListView.builder(
           itemCount: moviescount,
           itemBuilder: (BuildContext context, int index){
             if(movies[index].posterPath != null){
                         image = NetworkImage(movies[index].posterPath);
             }
             else{
                         image = NetworkImage('https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg');
             }
             return BuildCard(context ,image,index ,movies[index]);
           }
           ),
                      ),
                    ),
                  ],
                ),
              ),
       ),
     )
      
    );
  }
}




class BuildCard extends StatelessWidget {
 
  final NetworkImage image;
  final Movie movies;
  final int index;
  BuildCard(BuildContext context,this.image,this.index,this.movies);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
       
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        color: Colors.white
          
        ),
        
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 50.0,
              width: 50.0,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50.0),
               border: Border.all(width: 3,color: Colors.red.shade300),
               image: DecorationImage(image: image,fit: BoxFit.fill)
             ),
            ),
            VerticalDivider(
              color: Colors.blueAccent,
              thickness: 1,
              ),
              Expanded(
                child: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(movies.title,
                     style: TextStyle(
                       color: Colors.lightBlue.shade700,
                       fontWeight: FontWeight.bold,
                       fontSize: 18.0
                     ),
                     ),
                     SizedBox(height: 5.0,)
                     ,Row(
                       children: [
                         Icon(Icons.date_range_rounded,color: Colors.red.shade300,size: 20.0,),
                        SizedBox(width: 5.0,),
                         Text(movies.releaseDate,style: TextStyle(color: Colors.lightBlue.shade700,fontSize: 13.0),)
                       ],
                     ),
                      SizedBox(height: 5.0,)
                     ,Row(
                       children: [
                         Icon(Icons.rate_review,color: Colors.red.shade300,size: 20.0,),
                        SizedBox(width: 5.0,),
                         Text(movies.voteAverage.toString(),style: TextStyle(color: Colors.lightBlue.shade700,fontSize: 13.0),)
                       ],
                     ),
                    
                   ],
                 ),
                )
                ),
          ],
        ),
      ),
    );
  }
}