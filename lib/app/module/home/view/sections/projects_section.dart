import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/portfolio_data.dart';
import '../../../../theme/glass_theme.dart';
import '../../../../widget/custom_text_view.dart';
import '../../../../widget/glass_container.dart';
import '../../controller/home_controller.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  final double hPadding;

  const ProjectsSection({
    super.key,
    required this.isDesktop,
    required this.isMobile,
    required this.hPadding,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      key: controller.projectsKey,
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: PortfolioData.navProjects),
          const SizedBox(height: 40),
          DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorColor: GlassTheme.primaryColor,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white30,
                  labelStyle: GlassTheme.h3.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  tabs: const [
                    Tab(text: "APPLICATIONS"),
                    Tab(text: "ACHIEVEMENTS & LEADERSHIP"),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: _calculateHeight(context),
                  child: TabBarView(
                    children: [
                      _buildProjectsGrid(context),
                      _buildPluginsList(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calculateHeight(BuildContext context) {
    if (isMobile) {
      // Mobile is a column, height needs to be substantial
      return (PortfolioData.projects.length * 300.0) + 100;
    }
    final rows = (PortfolioData.projects.length / (isDesktop ? 3 : 2)).ceil();
    return (rows * 400.0) + 100;
  }

  Widget _buildProjectsGrid(BuildContext context) {
    if (isMobile) {
      return Column(
        children: PortfolioData.projects.map((proj) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildProjectCard(proj, context),
          );
        }).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: 380,
      ),
      itemCount: PortfolioData.projects.length,
      itemBuilder: (context, index) {
        final proj = PortfolioData.projects[index];
        return _buildProjectCard(proj, context);
      },
    );
  }

  Widget _buildProjectCard(dynamic proj, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentPadding = screenWidth < 400 ? 16.0 : 36.0;

    return GlassContainer(
      padding: EdgeInsets.all(contentPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.folder_open_rounded,
                  color: GlassTheme.primaryColor,
                ),
              ),
              _ProjectLinks(androidUrl: proj.androidUrl, iosUrl: proj.iosUrl),
            ],
          ),
          const SizedBox(height: 32),
          CustomTextView(
            text: proj.title,
            style: GlassTheme.h3.copyWith(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 16),
          if (!isMobile)
            Expanded(
              child: CustomTextView(
                text: proj.description,
                style: GlassTheme.body.copyWith(
                  color: Colors.white54,
                  height: 1.6,
                  fontSize: 15,
                ),
                maxLines: 5,
              ),
            )
          else
            CustomTextView(
              text: proj.description,
              style: GlassTheme.body.copyWith(
                color: Colors.white54,
                height: 1.6,
                fontSize: 15,
              ),
            ),
          const SizedBox(height: 24),
          CustomTextView(
            text: proj.techStack,
            style: GlassTheme.body.copyWith(
              color: GlassTheme.secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPluginsList(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentPadding = screenWidth < 400 ? 16.0 : 32.0;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PortfolioData.plugins.length,
      itemBuilder: (context, index) {
        final plu = PortfolioData.plugins[index];
        final hasUrl = plu.url.isNotEmpty;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GlassContainer(
            onTap: hasUrl ? () => launchUrl(Uri.parse(plu.url)) : null,
            padding: EdgeInsets.all(contentPadding),
            child: Row(
              children: [
                if (screenWidth > 300) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: GlassTheme.secondaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.star_rounded,
                      color: GlassTheme.secondaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        text: plu.name,
                        style: GlassTheme.h3.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      CustomTextView(
                        text: plu.description,
                        style: GlassTheme.body.copyWith(
                          color: Colors.white38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                if (hasUrl && screenWidth > 350)
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white12,
                    size: 16,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProjectLinks extends StatefulWidget {
  final String? androidUrl;
  final String? iosUrl;

  const _ProjectLinks({this.androidUrl, this.iosUrl});

  @override
  State<_ProjectLinks> createState() => _ProjectLinksState();
}

class _ProjectLinksState extends State<_ProjectLinks> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.androidUrl == null && widget.iosUrl == null) {
      return const SizedBox.shrink();
    }

    final hasAndroid = widget.androidUrl != null;
    final hasIos = widget.iosUrl != null;

    return TapRegion(
      onTapOutside: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => isHovered = !isHovered),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(
              horizontal: isHovered ? 12 : 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: isHovered
                  ? GlassTheme.primaryColor.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isHovered
                    ? GlassTheme.primaryColor.withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.1),
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: GlassTheme.primaryColor.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isHovered ? Icons.link : Icons.arrow_outward_rounded,
                  color: isHovered ? GlassTheme.primaryColor : Colors.white70,
                  size: 20,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  child: SizedBox(
                    width: isHovered ? null : 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 12),
                        if (hasAndroid)
                          _PlatformIcon(
                            icon: Icons.android,
                            url: widget.androidUrl!,
                          ),
                        if (hasAndroid && hasIos) const SizedBox(width: 12),
                        if (hasIos)
                          _PlatformIcon(icon: Icons.apple, url: widget.iosUrl!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlatformIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _PlatformIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Tooltip(
          message: "Open Link",
          child: Icon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
