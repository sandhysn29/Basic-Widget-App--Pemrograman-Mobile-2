import 'package:flutter/material.dart';

// Imnport package untuk carousel dan card swiper
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Widget Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://picsum.photos/id/1018/400/200',
      'https://picsum.photos/id/1020/400/200',
      'https://picsum.photos/id/1024/400/200',
    ];

    final CardSwiperController controller = CardSwiperController();

    return Scaffold(
      appBar: AppBar(title: const Text("Basic Widget Demo"), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu Drawer",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(title: Text("Home")),
            ListTile(title: Text("Profile")),
            ListTile(title: Text("Settings")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// --- Carousel Slider ---
            CarouselSlider(
              items: imgList
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

            /// --- Card Swiper ---
            const Text(
              "Card Swiper Example",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: CardSwiper(
                controller: controller,
                cardsCount: 5,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                      return Card(
                        color: Colors.blue[100 * ((index % 8) + 1)],
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Card ${index + 1}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
              ),
            ),

            const SizedBox(height: 30),

            /// --- Button Section ---
            const Text(
              "Button Section",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Click Me")),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: const Text("Outline")),
              ],
            ),

            const SizedBox(height: 30),

            /// --- TextField Section ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text("© 2025 Basic Widget App Demo"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
