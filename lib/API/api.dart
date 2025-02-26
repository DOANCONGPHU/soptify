import 'package:dio/dio.dart';
import 'package:soptify/models/Video.dart';
import 'package:soptify/models/artists.dart';
import 'package:soptify/models/trending.dart';


class ArtistsAPI{
  final Dio dio;

  ArtistsAPI(this.dio);
    Future<SeveralArtists> getPopularArtists() async {
    final respone =
          await dio.get<Map<String,dynamic>>('/3/trending/person/day?language=en-US');
    return SeveralArtists.fromJson(respone.data!);
  }
  
}
class AlbumsAPI{
  final Dio dio;

  AlbumsAPI(this.dio);
    Future<TrendingMoives> getTrendingMovies() async {
    final respone =
          await dio.get<Map<String,dynamic>>('/3/trending/movie/day?language=en-US');
    return TrendingMoives.fromJson(respone.data!);
  }
  
}

class VideosApi{
  final Dio dio;
    VideosApi(this.dio);
    
    Future<VideoMovies> getTrailergMovies(int id) async {
    final respone =
          await dio.get<Map<String,dynamic>>('/3/movie/${id}/videos');
    return VideoMovies.fromJson(respone.data!);
  }
}