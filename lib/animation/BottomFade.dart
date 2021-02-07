import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class BottomFade extends StatelessWidget {
  final double delay;
  final Widget child;

  BottomFade(this.delay , this.child);

  @override
  Widget build(BuildContext context) {

    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0 , end:1.0),
      curve: Curves.easeOut)
    ]);
    return ControlledAnimation(
      delay: Duration(milliseconds:(500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child,animation) => Opacity(
        opacity:animation["opacity"],
        child: child
      ),
    );
  }
}