import 'package:flutter/material.dart';
import '../../../../theme/glass_theme.dart';

class BackgroundMesh extends StatelessWidget {
  const BackgroundMesh({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: Stack(
        children: [
          AnimatedMeshBlob(
            top: -200,
            left: -100,
            color: GlassTheme.primaryColor,
            size: 800,
            duration: 20,
          ),
          AnimatedMeshBlob(
            bottom: -300,
            right: -200,
            color: GlassTheme.secondaryColor,
            size: 900,
            duration: 25,
          ),
          AnimatedMeshBlob(
            top: 1500,
            left: -300,
            color: GlassTheme.accentColor,
            size: 600,
            duration: 22,
          ),
        ],
      ),
    );
  }
}

class AnimatedMeshBlob extends StatefulWidget {
  final double size;
  final Color color;
  final int duration;
  final double? top, left, right, bottom;

  const AnimatedMeshBlob({
    super.key,
    required this.size,
    required this.color,
    required this.duration,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  @override
  State<AnimatedMeshBlob> createState() => _AnimatedMeshBlobState();
}

class _AnimatedMeshBlobState extends State<AnimatedMeshBlob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      right: widget.right,
      bottom: widget.bottom,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scaleX = 1 + 0.2 * _controller.value;
            final scaleY = 1 + 0.1 * _controller.value;
            return Transform(
              transform: Matrix4.diagonal3Values(scaleX, scaleY, 1.0),
              alignment: Alignment.center,
              child: Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      widget.color.withValues(alpha: 0.15),
                      widget.color.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
