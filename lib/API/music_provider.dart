
import 'package:flutter/foundation.dart';
import 'package:soptify/API/api.dart';
import 'package:soptify/models/Video.dart';
import 'package:soptify/models/artists.dart';
import 'package:soptify/models/trending.dart';

class MusicProvider extends ChangeNotifier {
  final ArtistsAPI apiArt;
  final AlbumsAPI apiAb;
  final VideosApi apiM;
  MusicProvider(this.apiAb, this.apiArt, this.apiM,);

  SeveralArtists? popularArtists;
  TrendingMoives? trending;
  VideoMovies? trailer;

  Future<void> getPopularArtists() async {
    popularArtists = (await apiArt.getPopularArtists());
    notifyListeners();
  }
  Future<void> getTrendingMovies() async {
    trending = (await apiAb.getTrendingMovies());
    notifyListeners();
  }
  Future<void> getTrailergMovies(int id) async {
    trailer = (await apiM.getTrailergMovies(id));
    notifyListeners();
  }
}