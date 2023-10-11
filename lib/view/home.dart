import 'package:flutter/material.dart';

import '../list/popularArtist.dart';
import '../list/topchart.dart';
import '../list/trendingnow.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  Container(
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
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        TrendingNow(
                          img: AssetImage("assets/ab1.jpg"),
                          label: "Shadow of love-track",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TrendingNow(
                          img: AssetImage("assets/thanhxuan.jpg"),
                          label: "Sống cho hết đời thanh xuân",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TrendingNow(
                          img: AssetImage("assets/chualanh.jpg"),
                          label: "Vết chữa lành",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TrendingNow(
                          img: AssetImage("assets/tun.jpg"),
                          label: "Đắp chăn nằm nghe tun kể",
                        ),
                      ],
                    ),
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
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            PopularArtist(
                              image: AssetImage("assets/bile.jpg"),
                            ),
                            SizedBox(width: 16),
                            PopularArtist(
                              image: AssetImage("assets/stung.jpg"),
                            ),
                            SizedBox(width: 16),
                            PopularArtist(
                              image: AssetImage("assets/tlinh.jpg"),
                            ),
                            SizedBox(width: 16),
                            PopularArtist(
                              image: AssetImage("assets/mck.jpg"),
                            ),
                            SizedBox(width: 16),
                            PopularArtist(
                              image: AssetImage("assets/cr7.jpg"),
                            ),
                            SizedBox(width: 16),
                            PopularArtist(
                              image: AssetImage("assets/m10.jpg"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
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
                              label: "New Album",
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
