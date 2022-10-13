import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Modular.to.pushNamed('./lista/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audios para Sexta Feira'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60,
        color: Colors.white,
        backgroundColor: AppTheme.colors.primary,
        items: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.audiotrack_rounded,
                size: 20,
                color: AppTheme.colors.primary,
              ),
              Visibility(
                visible: _currentIndex == 1,
                child: const Text('Audios'),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: AppTheme.colors.primary,
              ),
              Visibility(
                visible: _currentIndex == 0,
                child: const Text('Favoritos'),
              ),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Modular.to.pushReplacementNamed('../lista/');

            return;
          }

          Modular.get<AudioPlayer>().stop();
          Modular.to.pushReplacementNamed('../favorito/');
        },
      ),
    );
  }
}
