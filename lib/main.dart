import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: XylophoneApp1(),
        ),
      ),
    );
  }
}

class XylophoneApp1 extends StatefulWidget {
  const XylophoneApp1({Key? key}) : super(key: key);

  @override
  _XylophoneApp1State createState() => _XylophoneApp1State();
}

class _XylophoneApp1State extends State<XylophoneApp1> {
  void audioPlayer(int noteNumber) {
    final player = AssetsAudioPlayer();
    player.open(
      Audio("assets/note$noteNumber.wav"),
    );
  }

  @override
  Expanded buildKey({required int noteNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          audioPlayer(noteNumber);
          print('Note$noteNumber played');
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(noteNumber: 1, color: Colors.red),
        buildKey(noteNumber: 2, color: Colors.orange),
        buildKey(noteNumber: 3, color: Colors.yellow),
        buildKey(noteNumber: 4, color: Colors.green),
        buildKey(noteNumber: 5, color: Colors.teal),
        buildKey(noteNumber: 6, color: Colors.blue),
        buildKey(noteNumber: 7, color: Colors.purple),
      ],
    );
  }
}
