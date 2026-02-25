import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../theme/glass_theme.dart';
import '../controller/home_controller.dart';
import 'widgets/background_mesh.dart';
import 'widgets/nav_bar.dart';
import 'widgets/mobile_drawer.dart';
import 'widgets/footer.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: GlassTheme.backgroundColor,
      endDrawer: const MobileDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 1000;
          final isMobile = constraints.maxWidth < 600;
          final hPadding = constraints.maxWidth * (isDesktop ? 0.1 : 0.06);

          return Stack(
            children: [
              const BackgroundMesh(),
              SafeArea(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: HeroSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: AboutSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: EducationSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: ExperienceSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: ProjectsSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: ContactSection(
                          isDesktop: isDesktop,
                          isMobile: isMobile,
                          hPadding: hPadding,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: Footer(hPadding: hPadding),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FadeInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: NavBar(
                    isDesktop: isDesktop,
                    isMobile: isMobile,
                    hPadding: hPadding,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
