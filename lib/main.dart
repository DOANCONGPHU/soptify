import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soptify/API/api.dart';
import 'package:soptify/API/music_provider.dart';
import 'package:soptify/navigator/tabbar.dart';

final dio =
    Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org', headers: {
  'Content-Type': 'application/json',
  'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMGMyMDJmNWQ5Y2U5NTAwM2JjYzlkNWU3NjNhNGM3OCIsInN1YiI6IjY0ZGM3ZGI1ZmUwNzdhMDBjNzMxNDE2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Uf6ZVMM7fAIQH8yrlAGMcKdN8cjOvj76g3vonpkiokU'
}));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final api1 = AlbumsAPI(dio);
    final api2= ArtistsAPI(dio);
    final api3= VideosApi(dio);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        
        selectedLabelStyle: TextStyle(
          fontSize: 15
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15
        )
        ),
      ),

      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MusicProvider(api1, api2, api3),
          )
        ],
       child: const Tabbar(), 
      ),
      debugShowCheckedModeBanner: false,
    );
    
  }
}
