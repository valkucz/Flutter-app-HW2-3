import 'package:app/common/rate_enum.dart';
import 'package:app/model/movie.dart';
import 'package:app/model/movie_filter.dart';
import 'package:flutter/material.dart';

class MovieNotifier extends ChangeNotifier {
  final List<Movie> _movies = [];

  final MovieFilter _filter = MovieFilter();

  Rate? get currentRate => _filter.filterByRate;

  List<Movie> get movies => _filter.filterByRate == null
      ? _movies
      : getMoviesWithRate(_filter.filterByRate);

  List<Movie> getMoviesWithRate(rate) =>
      _movies.where((movie) => movie.rate == rate).toList();

  addMovie(Movie movie) {
    _movies.insert(0, movie);
    notifyListeners();
  }

  setMovie(int index, String name, Rate? rate) {
    _movies[index] = Movie(name: name, rate: rate);
    notifyListeners();
  }

  setFilter(Rate? rate) {
    _filter.filterByRate = rate == _filter.filterByRate ? null : rate;
    notifyListeners();
  }
}
