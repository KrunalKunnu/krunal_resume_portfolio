import '../../../../common_imports.dart';
import '../../controller/home_controller.dart';
import '../widgets/rotating_profession_text.dart';
import '../widgets/social_row.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const HeroSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      key: controller.heroKey,
      padding: EdgeInsets.only(
        left: hPadding,
        right: hPadding,
        top: isMobile ? 140 : 160,
        bottom: isMobile ? 40 : 100,
      ),
      child: Column(
        children: [
          if (isMobile) const SizedBox(height: 60),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: CustomTextView(
              text: PortfolioData.heroIntro,
              style: GlassTheme.h3.copyWith(
                color: Colors.white,
                letterSpacing: 8,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            duration: const Duration(milliseconds: 1000),
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  GlassTheme.primaryGradient.createShader(bounds),
              child: CustomTextView(
                text: PortfolioData.name,
                style: GlassTheme.h1.copyWith(
                  color: Colors.white,
                  fontSize: isMobile ? 40 : 80,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const RotatingProfessionText(),
          const SizedBox(height: 32),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: CustomTextView(
                text: PortfolioData.heroBio,
                style: GlassTheme.body.copyWith(
                  fontSize: isMobile ? 15 : 18,
                  height: 1.6,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 48),
          FadeInUp(
            duration: const Duration(milliseconds: 1600),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _CTAButton(
                  text: PortfolioData.resumeButtonText,
                  icon: Icons.article_outlined,
                  isPrimary: true,
                  onTap: () => launchExternalUrl(PortfolioData.resumeUrl),
                ),
                _CTAButton(
                  text: PortfolioData.hireMeButtonText,
                  icon: Icons.mail_outline_rounded,
                  isPrimary: false,
                  onTap: () => launchExternalUrl(PortfolioData.hireMeEmail),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          const SocialRow(),
        ],
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _CTAButton({
    required this.text,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: isPrimary ? GlassTheme.primaryGradient : null,
            color: isPrimary ? null : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: isPrimary ? null : Border.all(color: Colors.white10),
            boxShadow: [
              if (isPrimary)
                BoxShadow(
                  color: GlassTheme.primaryColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Flexible(
                child: CustomTextView(
                  text: text,
                  style: GlassTheme.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
