import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class MobileMenuTrigger extends StatelessWidget {
  const MobileMenuTrigger({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return IconButton(
      onPressed: () => controller.scaffoldKey.currentState?.openEndDrawer(),
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.menu_rounded, color: Colors.white),
      ),
    );
  }
}
