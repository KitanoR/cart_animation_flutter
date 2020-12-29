import 'package:flutter/material.dart';


class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final Curve curve;

  const ShakeTransition({
    Key key, 
    this.duration = const Duration(milliseconds: 600), 
    @required this.child,
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    this.curve = Curves.elasticOut
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      curve: curve,
      duration: duration,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child){
        return Transform.translate(
          offset: axis == Axis.horizontal 
            ? Offset(
              value * offset,
              0.0
            ) :
            Offset(
              0.0,
              value * offset
            ),
          child: child,
        );
      },
    );
  }
}