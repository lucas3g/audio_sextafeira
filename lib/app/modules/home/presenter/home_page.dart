import 'dart:io';

import 'package:audience_network/audience_network.dart';
import 'package:audio_sextafeira/app/core_module/components/widgets/audio_player_bottom_widget.dart';
import 'package:audio_sextafeira/app/core_module/constants/constants.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audio_sextafeira/app/modules/home/submodules/meus_audios/mobx/meus_audios_store.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:audio_sextafeira/app/utils/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final audioStore = Modular.get<AudioStore>();
  final meusAudiosStore = Modular.get<MeusAudiosStore>();

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));

  late final Animation<Offset> _animation =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
          .animate(_animationController);

  // final BannerAd myBanner = BannerAd(
  //   adUnitId: bannerID,
  //   size: AdSize.banner,
  //   request: const AdRequest(),
  //   listener: const BannerAdListener(),
  // );

  @override
  void initState() {
    super.initState();

    if (!Platform.isWindows) {
      AudienceNetwork.init(
        iOSAdvertiserTrackingEnabled: true,
        // testingId: "c48a4002-1ed6-4821-baa1-641c1243ce5b", //optional
        // testMode: true,
      );
    }

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
        title: const Text('Sons Engra??ados'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
        actions: [
          Visibility(
            visible: Constants.currentIndex == 1,
            child: IconButton(
              onPressed: () async {
                meusAudiosStore.clicouPesquisar();
                if (!meusAudiosStore.pesquisar) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(builder: (context) {
            return Visibility(
              visible: audioStore.state is PlayAudioState ||
                  audioStore.state is PauseAudioState,
              child: AudioPlayerBottomWidget(audioStore: audioStore),
            );
          }),
          if (!Platform.isWindows) ...[
            Container(
              alignment: const Alignment(0.5, 1),
              child: BannerAd(
                placementId: bannerID,
                bannerSize: BannerSize.STANDARD,
                listener: BannerAdListener(
                  onLoaded: () => print('Ad carregou'),
                  onError: (code, message) => print(message),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          CurvedNavigationBar(
            index: Constants.currentIndex,
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
                    visible: Constants.currentIndex != 0,
                    child: const Text('Audios'),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_circle,
                    size: 20,
                    color: AppTheme.colors.primary,
                  ),
                  Visibility(
                    visible: Constants.currentIndex != 1,
                    child: const Text('Meus Audios'),
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
                    visible: Constants.currentIndex != 2,
                    child: const Text('Favoritos'),
                  ),
                ],
              ),
            ],
            onTap: (index) async {
              setState(() {
                Constants.currentIndex = index;
              });

              await Modular.get<AudioStore>().stopAudio();

              if (index == 0) {
                Modular.to.pushReplacementNamed('../lista/');

                return;
              }

              if (index == 1) {
                Modular.to.pushReplacementNamed('../meus_audios/', arguments: {
                  'animation': _animation,
                });

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
