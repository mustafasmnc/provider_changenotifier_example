import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  List<Favorites> favs = [];
  String myFav = 'Banana';
  String myFavThing = 'Fruit';

  Favorites({this.myFavThing, this.myFav});

  void changeMyFav(String myNewFav) {
    myFav = myNewFav;
    notifyListeners();
  }

  void changemyFavThing(String myNewFavThing) {
    myFavThing = myNewFavThing;
    notifyListeners();
  }

  void addFavs(String favThing, String fav) {
    Favorites favorite = Favorites(myFavThing: favThing, myFav: fav);
    favs.add(favorite);
    notifyListeners();
  }
}
