import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TONTONANMU',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> bannerList = const [
    'https://picsum.photos/800/400?random=1',
    'https://picsum.photos/800/400?random=2',
    'https://picsum.photos/800/400?random=3',
  ];

  final List<String> smallList = const [
    'https://picsum.photos/200/300?random=4',
    'https://picsum.photos/200/300?random=5',
    'https://picsum.photos/200/300?random=6',
    'https://picsum.photos/200/300?random=7',
    'https://picsum.photos/200/300?random=8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text(
            "TONTONANMU",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Banner Carousel ---
            CarouselSlider(
              items: bannerList
                  .map(
                    (item) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
            ),
            const SizedBox(height: 20),

            // Recently Watched
            buildCarouselSelection('Recently Watched', smallList),

            // Trending
            buildCarouselSelection('Trending', smallList),

            // Popular
            buildCarouselSelection('Popular', smallList),

            const SizedBox(height: 30),

            const SizedBox(height: 20),
            Center(
              child: Text(
                "© 2025 Basic Widget App Demo",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Posisi default: HOME
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Widget Reusable untuk Carousel Mini
  Widget buildCarouselSelection(String title, List<String> imgList) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10),
          CarouselSlider(
            items: imgList
                .map(
                  (item) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(item, fit: BoxFit.cover, width: 120),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 150,
              autoPlay: false,
              viewportFraction: 0.4,
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
            ),
          ),
        ],
      ),
    );
  }
}
