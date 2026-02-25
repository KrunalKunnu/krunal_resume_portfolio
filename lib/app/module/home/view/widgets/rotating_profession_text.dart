import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../controller/home_controller.dart';

class RotatingProfessionText extends StatelessWidget {
  const RotatingProfessionText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallMobile = screenWidth < 400;

    return Container(
      constraints: BoxConstraints(minHeight: isSmallMobile ? 40 : 60),
      width: double.infinity,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Obx(
            () => TypewriterText(
              key: ValueKey<int>(controller.rotatingIndex.value),
              text: PortfolioData.rotatingTitles[controller.rotatingIndex.value]
                  .toUpperCase(),
              style: GlassTheme.h2.copyWith(
                color: Colors.white,
                letterSpacing: 4,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const TypewriterText({
    super.key,
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
        milliseconds: widget.text.length * widget.duration.inMilliseconds,
      ),
      vsync: this,
    );
    _characterCount = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        String visibleString = widget.text.substring(0, _characterCount.value);
        return CustomTextView(
          text: visibleString,
          style: widget.style,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
