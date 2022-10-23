import 'package:audio_sextafeira/app/core_module/components/widgets/audio_player_bottom_widget.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex = 0;
  final AudioStore audioStore = Modular.get<AudioStore>();

  // final BannerAd myBanner = BannerAd(
  //   adUnitId: bannerID,
  //   size: AdSize.banner,
  //   request: const AdRequest(),
  //   listener: const BannerAdListener(),
  // );

  @override
  void initState() {
    super.initState();

    // if (!Platform.isWindows) {
    //   myBanner.load();
    // }

    Modular.to.pushNamed('./lista/');
  }

  @override
  Widget build(BuildContext context) {
    // final AdWidget adWidget = AdWidget(ad: myBanner);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audios para Sexta Feira'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(builder: (context) {
            return Visibility(
              visible: audioStore.state is PlayAudioState,
              child: AudioPlayerBottomWidget(audioStore: audioStore),
            );
          }),
          // if (!Platform.isWindows) ...[
          //   Container(
          //     alignment: Alignment.center,
          //     width: myBanner.size.width.toDouble(),
          //     height: myBanner.size.height.toDouble(),
          //     child: adWidget,
          //   ),
          //   const SizedBox(height: 10),
          // ],
          CurvedNavigationBar(
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
            onTap: (index) async {
              setState(() {
                _currentIndex = index;
              });

              await Modular.get<AudioStore>().stopAudio();

              if (index == 0) {
                Modular.to.pushReplacementNamed('../lista/');

                return;
              }

              Modular.to.pushReplacementNamed('../favorito/');
            },
          ),
        ],
      ),
    );
  }
}
