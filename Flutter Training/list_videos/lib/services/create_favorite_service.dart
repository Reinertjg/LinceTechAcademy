
import 'package:flutter/cupertino.dart';

import '../models/video_model.dart';

class CreateFavoriteRepository with ChangeNotifier{

  final _favoritesList = <FavoriteVideo>[];

  List<FavoriteVideo> get favorites => List.unmodifiable(_favoritesList);

  void addFavorite(FavoriteVideo video) {
    _favoritesList.add(video);
    notifyListeners();
  }

  void removeFavorite(FavoriteVideo video) {
    _favoritesList.remove(video);
    notifyListeners();
  }

}