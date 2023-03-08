import 'dart:async';

import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/states/audio_states.dart';
import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:audio_sextafeira/app/modules/home/submodules/lista_audios/presenter/mobx/audio_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class AudioPlayerBottomWidget extends StatefulWidget {
  final AudioStore audioStore;
  const AudioPlayerBottomWidget({
    Key? key,
    required this.audioStore,
  }) : super(key: key);

  @override
  State<AudioPlayerBottomWidget> createState() =>
      _AudioPlayerBottomWidgetState();
}

class _AudioPlayerBottomWidgetState extends State<AudioPlayerBottomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';

  @override
  void initState() {
    _animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    super.initState();

    _initStreams();

    autorun((_) {
      if (widget.audioStore.state is PauseAudioState) {
        _animation.forward();
      }
      if (widget.audioStore.state is PlayAudioState) {
        _animation.reverse();
      }
    });
  }

  void _initStreams() {
    _durationSubscription =
        widget.audioStore.audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription =
        widget.audioStore.audioPlayer.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription =
        widget.audioStore.audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration.zero;
      });
    });
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Slider(
            activeColor: AppTheme.colors.primary,
            onChanged: (v) {
              final duration = _duration;
              if (duration == null) {
                return;
              }
              final position = v * duration.inMilliseconds;
              widget.audioStore.audioPlayer
                  .seek(Duration(milliseconds: position.round()));
            },
            value: (_position != null &&
                    _duration != null &&
                    _position!.inMilliseconds > 0 &&
                    _position!.inMilliseconds < _duration!.inMilliseconds)
                ? _position!.inMilliseconds / _duration!.inMilliseconds
                : 0.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tempo:',
                style: AppTheme.textStyles.labelButtonLogin,
              ),
              const SizedBox(width: 10),
              Text(
                _position != null
                    ? '$_positionText / $_durationText'
                    : _duration != null
                        ? _durationText
                        : '',
                style: AppTheme.textStyles.labelButtonLogin,
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: widget.audioStore.pauseResumeAudio,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: _animation,
                ),
                color: AppTheme.colors.primary,
              ),
              const SizedBox(width: 10),
              Observer(builder: (context) {
                return InkWell(
                  onTap: widget.audioStore.setSpeedAudio,
                  child: Text(
                    widget.audioStore.set2x ? '1x' : '2x',
                    style: AppTheme.textStyles.labelButtonLogin,
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
