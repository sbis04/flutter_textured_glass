import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fluted Glass Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int get getRandomNumber => Random().nextInt(1000);
  String get _randomImage =>
      'https://source.unsplash.com/random/1280x720?nature#$getRandomNumber';
  late final List<String> _randomImages;

  @override
  void initState() {
    super.initState();
    _randomImages = List.generate(50, (index) => _randomImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.2),
      body: Stack(
        children: [
          ImageListView(randomImages: _randomImages),
          const FrostedGlassNavBar(),
        ],
      ),
    );
  }
}

class ImageListView extends StatelessWidget {
  const ImageListView({
    super.key,
    required List<String> randomImages,
  }) : _randomImages = randomImages;

  final List<String> _randomImages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: List.generate(
                _randomImages.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        _randomImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrostedGlassNavBar extends StatelessWidget {
  const FrostedGlassNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/glass_pattern_4.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  Colors.deepPurple.withOpacity(0.3),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: const SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.houseChimneyMedical,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black87, blurRadius: 6.0)
                      ],
                    ),
                    FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black87, blurRadius: 6.0)
                      ],
                    ),
                    FaIcon(
                      FontAwesomeIcons.message,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(color: Colors.black87, blurRadius: 6.0)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
