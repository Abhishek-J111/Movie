// import 'package:flutter/material.dart';
// import '../Model/movies.dart';

// class MovieDetails extends StatefulWidget {
//   final Movie movie;
//   final String index;
//   MovieDetails(this.movie,this.index);

//   @override
//   _MovieDetailsState createState() => _MovieDetailsState();
// }

// class _MovieDetailsState extends State<MovieDetails> {
//   String path='https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

//   @override
//   void initState(){
//     if(widget.movie.posterPath != null){
//       setState(() {
//       path = widget.movie.posterPath;  
//       });
      
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.movie.title),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//         padding: EdgeInsets.all(6),
//         height: MediaQuery.of(context).size.height /1.8,
//         child: Image.network(path),

//                 ),
//                 buildContainer('Name:',widget.movie.title),
//                 buildContainer('Ratings:', widget.movie.voteAverage.toString()),
//                 buildContainer('ReleaseDate', widget.movie.releaseDate.toString()),
//                 Container(
//         padding: EdgeInsets.all(10.0),
//         child: Text(widget.movie.overview),
//                 )
//               ],
//             ),
//           )
//         ),
      
//     );
//   }

//   Container buildContainer(String titleText,subText) {
//     return Container(
//                 padding: EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     Text(titleText, style: TextStyle(color: Colors.blueAccent,fontSize: 25.0,fontWeight: FontWeight.bold),),
//                       Text(subText, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),)
//                   ],
//                 ),
//               );
//   }
// }