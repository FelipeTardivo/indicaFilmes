import 'dart:convert';
import 'package:indica_filmes/constants.dart';
import 'package:indica_filmes/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?=${Constants.apiKey}';

  Future <List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      //o código acima é para verificar se a API está retornando os dados corretamente no DEBUG CONSOLE
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception ('Erro ao carregar filmes');  
    }
  }
}