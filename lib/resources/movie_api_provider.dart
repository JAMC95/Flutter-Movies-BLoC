import 'dart:convert';

import 'package:flutter_movies_bloc/models/movie_item.dart';
import 'package:flutter_movies_bloc/models/trailer_item.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client http = Client();
  static final _apiKey = "e89f9f7cbba267b8c7025fc06a1bb120";
  final _baseUrl = "https://api.themoviedb.org/3/movie";
  final _tail = "?api_key=$_apiKey";

  Future<MovieItem> getPopularMovies() async {
    final response = await http.get("$_baseUrl/popular$_tail");
   if(response.statusCode == 200) {
     return MovieItem.fromJson(json.decode(response.body));
   } else {
     throw Exception('Error al obtener películas populares');
   }

  }
  
  Future<TrailerItem> getVideos(int movieId) async {
    final response = await http.get("$_baseUrl/$movieId/videos$_tail");
    if(response.statusCode == 200) {
      return TrailerItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener los vídeos de la película');
    }
  }


}