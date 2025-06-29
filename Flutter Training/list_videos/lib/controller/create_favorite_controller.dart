
import 'package:flutter/cupertino.dart';
import 'package:list_videos/models/video_model.dart';
import 'package:provider/provider.dart';
import '../network/noembed_http.dart';
import '../services/create_favorite_service.dart';

class CreateFavoriteController {

  Future<bool> saveFavorite(BuildContext context, String url, String category) async {
    final service = CreateFavoriteService();
    final repo = Provider.of<CreateFavoriteRepository>(context, listen: false);
    try {
      final data = await conversorData(url);
      final FavoriteVideo video = FavoriteVideo(
        title: data['title'],
        category: service.createCategory(category),
        thumbnailUrl: data['thumbnail_url'],
      );
      repo.addFavorite(video);
      return true;
    } catch (error) {
      print('Error saving favorite: $error');
      return false;
    }
  }

}