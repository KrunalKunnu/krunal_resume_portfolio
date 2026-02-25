import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/glass_theme.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final double blur;
  final double borderWith;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool enableHover;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 24,
    this.blur = 15,
    this.borderWith = 1,
    this.color,
    this.padding,
    this.margin,
    this.onTap,
    this.enableHover = true,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _hoverAnimation;
  double rotateX = 0;
  double rotateY = 0;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _hoverAnimation = CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHover(PointerEvent event, Size size) {
    if (!widget.enableHover) return;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    setState(() {
      // Gentle but noticeable 3D tilt
      rotateX = (centerY - event.localPosition.dy) / (size.height * 8);
      rotateY = (event.localPosition.dx - centerX) / (size.width * 8);
      isHovered = true;
      _hoverController.forward();
    });
  }

  void _onHoverExit(PointerEvent event) {
    setState(() {
      rotateX = 0;
      rotateY = 0;
      isHovered = false;
      _hoverController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: MouseRegion(
        onEnter: (e) => widget.enableHover ? _hoverController.forward() : null,
        onExit: _onHoverExit,
        onHover: (e) {
          if (!widget.enableHover) return;
          final box = context.findRenderObject() as RenderBox;
          _onHover(e, box.size);
        },
        cursor: widget.onTap != null
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: _hoverAnimation,
            builder: (context, child) {
              final hoverValue = _hoverAnimation.value;

              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotateX * hoverValue)
                ..rotateY(rotateY * hoverValue)
                ..setTranslationRaw(0.0, -8.0 * hoverValue, 0.0);

              final dynamicBlur = widget.blur;

              Widget glassContent = ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: dynamicBlur,
                    sigmaY: dynamicBlur,
                  ),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    padding: widget.padding ?? const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color:
                          widget.color ?? Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      border: Border.all(
                        color: Colors.white.withValues(
                          alpha: 0.1 + (0.05 * hoverValue),
                        ),
                        width: widget.borderWith,
                      ),
                      boxShadow: [
                        if (isHovered)
                          BoxShadow(
                            color: GlassTheme.primaryColor.withValues(
                              alpha: 0.1 * hoverValue,
                            ),
                            blurRadius: 30,
                            spreadRadius: -5,
                            offset: Offset(0, 10 * hoverValue),
                          ),
                      ],
                    ),
                    child: widget.child,
                  ),
                ),
              );

              if (widget.onTap != null) {
                glassContent = GestureDetector(
                  onTap: widget.onTap,
                  child: glassContent,
                );
              }

              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: glassContent,
              );
            },
          ),
        ),
      ),
    );
  }
}
