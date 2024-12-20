import 'package:popcorn/screens/movie_description/model/film_cast_model.dart';
import 'package:popcorn/screens/movie_description/model/movie_desc_model.dart';
import 'package:popcorn/screens/movie_description/model/similar_movie_model.dart';
import 'package:popcorn/screens/movie_description/model/user_rating_model.dart';

class movieDescriptionController {
  Future<movieDescriptionModel> getMovieData(int movieID) async {
    return await movieDescriptionModel.fetchMovieData(movieID);
  }

  Future<movieUserDataModel> getMovieEntry(int movieID) async {
    return await movieUserDataModel.fetchMovieEntry(movieID);
  }

  Future<similarMoviesModel> getSimilarMovies(int movieID) async {
    return await similarMoviesModel.fetchSimilarMovies(movieID);
  }

  Future<FilmCastModel> getFilmCast(int movieID) async {
    return await FilmCastModel.fetchFilmCast(movieID);
  }
}
