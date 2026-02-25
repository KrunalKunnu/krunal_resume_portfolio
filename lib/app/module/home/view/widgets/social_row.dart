import '../../../../common_imports.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1800),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 0,
        runSpacing: 16,
        children: PortfolioData.socials.map((social) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SocialIcon(icon: social.icon, url: social.url),
          );
        }).toList(),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const SocialIcon({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 58,
      height: 58,
      borderRadius: 29,
      padding: EdgeInsets.zero,
      onTap: () => launchExternalUrl(url),
      child: Center(child: Icon(icon, color: Colors.white, size: 22)),
    );
  }
}
