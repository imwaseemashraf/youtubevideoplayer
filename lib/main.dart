import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  late YoutubePlayerController _controller;
  final youtubeUrl = "https://youtu.be/CcxH6RqGtaA";
  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(youtubeUrl);

    _controller = YoutubePlayerController(
      initialVideoId: "CcxH6RqGtaA",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        startAt: 00,
        showLiveFullscreenButton: true,
        controlsVisibleAtStart: true,
        enableCaption: true,
        forceHD: true,
        useHybridComposition: true,
        captionLanguage: "ur",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
          ),
        ],
      )),
    );
  }
}
