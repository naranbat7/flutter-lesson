import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListIds = [];
  int currentIdx = 0;
  bool isLoggedIn = false;

  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  List<MovieModel> get wishMovies => movies.where((element) => isWishMovie(element)).toList();

  void addWishList(int id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  bool isWishMovie(MovieModel data) {
    return wishListIds.any((element) => element == data.id);
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void onLogin() {
    isLoggedIn = true;
    notifyListeners();
  }

  void onLogout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
