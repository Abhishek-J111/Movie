import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'movies.dart';


class HttpHelper{
  final String urlKey = 'api_key=6b70c8fa711ab3610df52a603a00995e';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
 
 Future getUpcoming() async{
    final String upcoming = urlBase + urlUpcoming + urlKey;

    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok){
      
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse["results"];
      // print(movieMap);
      List movie = movieMap.map((i) =>
      Movie.fromJson(i)).toList();
     print(movie);
      return movie;
    } 
    else{
      return null;
    }
  }
}

