import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/movies_model.dart';

class MoviesProvider {

  String _apiKey = '1159d7b1bfb61ad2784d72eb48ee718d';
  String _url = 'api.themoviedb.org/3/movie/now_playing';
  String _language = 'es-ES';


  Future<List<Movie>> getInCines() async {

    final url = Uri.https(_url, "3/movie/now_playing",{
      'api_key': _apiKey ,
      'language': _language
    });

    final request = await http.get( url );

    final decodeData = json.decode(request.body);

    final movies = new Movies.fromJsonList(decodeData['result']);

    print( decodeData);

    return movies.items;

  }



}