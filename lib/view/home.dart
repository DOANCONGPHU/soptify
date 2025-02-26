import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soptify/API/music_provider.dart';

import '../list/popularArtist.dart';
import '../list/topchart.dart';
import '../list/trendingnow.dart';





class HomeView extends StatefulWidget {
  const HomeView({super.key,});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   @override
  void initState() {
    context.read<MusicProvider>().getTrendingMovies();
    context.read<MusicProvider>().getPopularArtists();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.pink.withOpacity(0.7),
                Colors.white.withOpacity(0)
              ])),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Image(
                                      image: AssetImage("assets/congphu.jpg"),
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Good Morning'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.sunny)
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Text("Đoàn Công Phú",style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.search_sharp),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.notifications)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Trending Now",
                            style: Theme.of(context).textTheme.headlineSmall),
                        const Text(
                          "See All",
                          style: TextStyle(
                            color: Color.fromARGB(255, 21, 141, 83),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Row(                  
                    children:<Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 250,
                          child: Consumer<MusicProvider>(
                            builder: (context, value, child) {
                              if (value.trending == null) {
                                return const CircularProgressIndicator();
                              }
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final trend = value.trending!.results[index];

                                  return TrendingNow(
                                    img: NetworkImage('https://image.tmdb.org/t/p/w500${trend.posterPath}'), 
                                    label: trend.title ,
                                    overview: trend.overview,
                                    id: trend.id
                                    
                                  );
                                },
                                // separatorBuilder: (context, index) => const Divider(),
                                itemCount: value.trending!.results.length, 
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Artists",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const Text(
                              "See All",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 21, 141, 83)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 170,
                              child: Consumer<MusicProvider>(builder: (context, value, child) {
                                if (value.popularArtists == null) {
                                  return const CircularProgressIndicator();
                                }
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    final people = value.popularArtists!.results[index];
                                    return PopularArtist(
                                        image:  NetworkImage('https://image.tmdb.org/t/p/w500${people.profilePath}'),
                                        label: people.name);
                                  },
                                  itemCount: value.popularArtists?.results.length,
                                );
                              }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Top Charts",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            TopChart(
                              label: "Top 50 - Global",
                              img: AssetImage("assets/top50.jpg"),
                            ),
                            SizedBox(width: 16),
                            TopChart(
                              label: "New Movies",
                              img: AssetImage("assets/newab.jpg"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            TopChart(
                              label: "Viral 50",
                              img: AssetImage("assets/viral.jpg"),
                            ),
                            SizedBox(width: 16),
                            TopChart(
                              label: "Viet Nam",
                              img: AssetImage("assets/chill.jpg"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            TopChart(
                              label: "Top 50 - USA",
                              img: AssetImage("assets/top50usa.jpg"),
                            ),
                            SizedBox(width: 16),
                            TopChart(
                              label: "Hot Hits",
                              img: AssetImage("assets/hothit.jpg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
                ),
          ),
        ),
      ],
    ));
  }
}



