import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();

  void createMusic() {
    assetsAudioPlayer!.open(Audio('asset/audio/humraah.mp3'),
    autoStart: false,
    showNotification: true);
    notifyListeners();
  }
}
