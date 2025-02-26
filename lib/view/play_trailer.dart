import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soptify/API/music_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../API/api.dart';
import '../main.dart';

class OpenTrailer extends StatelessWidget {
  final int id;

  const OpenTrailer({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api1 = AlbumsAPI(dio);
    final api2 = ArtistsAPI(dio);
    final api3 = VideosApi(dio);
    return MaterialApp(
      home: ChangeNotifierProvider<MusicProvider>(
        create: (context) => MusicProvider(api1, api2, api3),
        child: OpenYoutube(id: id),
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OpenYoutube extends StatefulWidget {
  final int id;

  const OpenYoutube({Key? key, required this.id}) : super(key: key);

  @override
  State<OpenYoutube> createState() => _OpenYoutubeState();
}

class _OpenYoutubeState extends State<OpenYoutube> {
  Future<String> fetchData() async {
    final musicProvider = context.read<MusicProvider>();
    await musicProvider.getTrailergMovies(widget.id);
    if (musicProvider.trailer?.results[0].key != null) {
      final data =musicProvider.trailer?.results[0].key;
      return data!;
    } else {
      return 'ZWcRmoLqhkc';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: snapshot.data!,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
              liveUIColor: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
