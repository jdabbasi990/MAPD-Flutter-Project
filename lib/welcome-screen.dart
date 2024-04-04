import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // playBackgroundMusic();
  }

  Future<void> playBackgroundMusic() async {
    audioPlayer = AudioPlayer();
    await audioPlayer.setSourceAsset('audio/BG_Music.mp3');
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.resume();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Space Drift',
                  style: TextStyle(
                      fontSize: 120,
                      color: Color.fromARGB(255, 255, 174, 0),
                      fontFamily: 'SpaceCrusaders'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    audioPlayer.stop();

                    Navigator.pushNamed(context, '/game');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 174, 0),
                        fontFamily: 'SpaceCrusaders'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
