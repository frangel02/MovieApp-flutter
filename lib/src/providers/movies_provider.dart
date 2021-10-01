import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/movies_model.dart';

class MoviesProvider {

  String _apikey = '1159d7b1bfb61ad2784d72eb48ee718d';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';


   Future<List<Movie>> getInCines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apikey,
      'language' : _language
    });

    return await _procesarRespuesta(url);

  }


  Future<List<Movie>> _procesarRespuesta(Uri url) async {
    
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);


    return movies.items;
  }




}