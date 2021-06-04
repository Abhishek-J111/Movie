
class Movie{
  late int id;
  late String title;
  late double voteAverage;
 late String overview;
  late String posterPath;
  late String releaseDate;
  Movie(this.id,this.title,this.voteAverage,this.overview,this.posterPath,this.releaseDate);

  Movie.fromJson(Map<String,dynamic> parsedJson){
    this.id = parsedJson["id"];
    this.title=parsedJson["title"];
    this.voteAverage= parsedJson["vote_average"]*1.0;
    this.overview = parsedJson["overview"];
    this.posterPath="https://image.tmdb.org/t/p/w92/"+parsedJson["poster_path"].toString();
    this.releaseDate=parsedJson["release_date"];
  }
}