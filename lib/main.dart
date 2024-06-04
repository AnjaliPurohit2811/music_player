import 'package:flutter/material.dart';
import 'package:music_player/screens/homescreen/provider/music_provider.dart';
import 'package:music_player/screens/homescreen/view/home_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(ChangeNotifierProvider(
    create: (context) => MusicProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
