import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MouseScale extends StatefulWidget {
  final Widget child;
  const MouseScale({super.key, required this.child});

  @override
  State<MouseScale> createState() => _MouseScaleState();
}

class _MouseScaleState extends State<MouseScale> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {}
      },
      child: widget.child,
    );
  }
}
