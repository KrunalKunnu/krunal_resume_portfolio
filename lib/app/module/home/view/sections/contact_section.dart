import '../../../../common_imports.dart';
import '../../controller/home_controller.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const ContactSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      key: controller.contactKey,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          const SectionTitle(title: PortfolioData.contactTitle),
          const SizedBox(height: 40),
          GlassContainer(
            padding: EdgeInsets.all(
              isMobile
                  ? (MediaQuery.of(context).size.width < 400 ? 24 : 32)
                  : 56,
            ),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) =>
                      GlassTheme.primaryGradient.createShader(bounds),
                  child: CustomTextView(
                    text: "LET'S BUILD THE FUTURE",
                    style: GlassTheme.h1.copyWith(
                      fontSize: isMobile ? 32 : 64,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextView(
                  text: PortfolioData.contactDesc,
                  style: GlassTheme.body.copyWith(fontSize: 18, height: 1.8),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _ContactButton(
                      text: "INITIATE COLLABORATION",
                      icon: Icons.auto_awesome_rounded,
                      isPrimary: true,
                      onTap: () => launchExternalUrl(PortfolioData.hireMeEmail),
                    ),
                    _ContactButton(
                      text: "LINKEDIN PROFILE",
                      icon: Icons.business_center_rounded,
                      isPrimary: false,
                      onTap: () => launchExternalUrl(
                        PortfolioData.socials
                            .firstWhere((s) => s.label == "LinkedIn")
                            .url,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ContactButton({
    required this.text,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallMobile = screenWidth < 400;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallMobile ? 20 : 32,
            vertical: isSmallMobile ? 14 : 18,
          ),
          decoration: BoxDecoration(
            gradient: isPrimary ? GlassTheme.primaryGradient : null,
            color: isPrimary ? null : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(14),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: isSmallMobile ? 18 : 20),
              SizedBox(width: isSmallMobile ? 8 : 14),
              Flexible(
                child: CustomTextView(
                  text: text,
                  style: GlassTheme.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: isSmallMobile ? 14 : 16,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
