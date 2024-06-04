import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screens/homescreen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MusicProvider>(context , listen: false).createMusic();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MusicProvider musicProviderTrue = Provider.of<MusicProvider>(context, listen: true);
    MusicProvider musicProviderFalse = Provider.of<MusicProvider>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                musicProviderFalse.assetsAudioPlayer!
                    .open(Audio('asset/audio/humraah.mp3'));
              },
             icon: const Icon(Icons.play_circle_fill_outlined)),
          IconButton(
              onPressed: () {
                musicProviderFalse.assetsAudioPlayer!.pause();
              },
              icon: const Icon(Icons.pause_circle_outline)),
          IconButton(
              onPressed: () {
                musicProviderFalse.assetsAudioPlayer!.play();
              },
              icon: const Icon(Icons.play_arrow_outlined)),
        ],
      ),
    );
  }
}
