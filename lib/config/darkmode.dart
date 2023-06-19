import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../api/theme_service.dart';

class DarkModeToggle extends StatefulWidget {
  const DarkModeToggle({
    super.key,
  });

  @override
  State<DarkModeToggle> createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        if (isPressed == true) {
          _controller.animateTo(0.7);
        } else {
          _controller.animateBack(0.1);
        }

        Provider.of<ThemeService>(context, listen: false).toggleTheme();
      },
      child: LottieBuilder.network(
          height: 40,
          "https://lottie.host/9cf0f157-ad40-4d71-86b4-90803d27c65f/tIlqsw1NOx.json",
          controller: _controller,
          repeat: false,
          reverse: false, onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller.duration = composition.duration;
      }),
    );
  }
}
