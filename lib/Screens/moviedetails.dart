import 'package:flutter/material.dart';
import '../Model/movies.dart';

class MovieDetail extends StatefulWidget {
  final NetworkImage image;
  final Movie movies;
  final int index;
  MovieDetail(this.image, this.movies, this.index);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    double tHeight = MediaQuery.of(context).size.height;
    double cHeight = MediaQuery.of(context).size.height * 0.45;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        body: Hero(
          tag: "movies"+widget.index.toString(),
                  child: Container(
            child: Column(
              children: [
                Container(
                    height: cHeight,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade300,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: Center(
                            child: Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                  image: widget.image, fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(40.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        height: tHeight - cHeight,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              widget.movies.title,
                              style: TextStyle(
                                  color: Colors.lightBlue.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                            SizedBox(),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                              widget.movies.overview,
                              style: TextStyle(fontSize: 14.0),
                            ),
                                ))
                          ],
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
