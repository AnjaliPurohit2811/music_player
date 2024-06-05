import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  late VideoPlayerController _playerController;
  late ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"));
    videoPlayerController.initialize().then((value) => setState(() {}));
    _playerController = VideoPlayerController.networkUrl(Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'));
    _playerController.initialize().then((value) => setState(() {}));
    chewieController = ChewieController(videoPlayerController: _playerController);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayer'),
      ),
      body: Column(
        children: [
          AspectRatio(aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),),
          SizedBox(height: 20,),
          AspectRatio(aspectRatio: _playerController.value.aspectRatio,
          child: Chewie(controller: chewieController),)
        ],
      ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: () {
          videoPlayerController.play();
        }, icon: Icon(Icons.play_circle_outline , size: 35,)),
        IconButton(onPressed: () {
          videoPlayerController.pause();
        }, icon: Icon(Icons.pause_circle_outline , size: 35,))
      ],
    ),
    );
  }
}
