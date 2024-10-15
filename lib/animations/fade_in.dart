import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInAnything extends StatelessWidget {
  final Widget child;
  const FadeInAnything({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(
        curve: Curves.easeOut,
        begin: const Duration(milliseconds: 250),
        end: const Duration(milliseconds: 750), // Adjusted end duration
      ).tween('opacity', Tween(begin: 0.0, end: 1.0));

    return PlayAnimationBuilder(
      tween: tween, // Pass in tween
      duration: tween.duration, // Obtain duration
      builder: (context, value, widget) {
        return Opacity(opacity: value.get('opacity'), child: child);
      },
    );
  }
}

class FadeInLongAnything extends StatelessWidget {
  final Widget child;
  const FadeInLongAnything({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(
        curve: Curves.easeOut,
        begin: const Duration(milliseconds: 250),
        end: const Duration(milliseconds: 4000), // Adjusted end duration
      ).tween('opacity', Tween(begin: 0.0, end: 1.0));

    return PlayAnimationBuilder(
      tween: tween, // Pass in tween
      duration: tween.duration, // Obtain duration
      builder: (context, value, widget) {
        return Opacity(opacity: value.get('opacity'), child: child);
      },
    );
  }
}
