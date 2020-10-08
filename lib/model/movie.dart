import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviebooking/resources/constants.dart' as creds;


class Movie {
  final int movieId;
  final String title;
  final String url;
  final String description;

  Movie({
    this.movieId,
    this.title,
    this.url,
    this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
      movieId: json['id'] as int,
      title: json['title'] as String,
      url: creds.getPosterURLPrefix + (json['poster_path'] as String),
      description: json['overview'] as String,
    );
  }
}

Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client
      .get(creds.getMoviesURL);
  return parseMovies(response.body);
}

List<Movie> parseMovies(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed["results"] as List)
      .map<Movie>((json) => new Movie.fromJson(json))
      .toList();
}