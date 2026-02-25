import 'app/extension/mouse_scale.dart';
import 'app/module/home/binding/home_binding.dart';
import 'app/module/home/view/home_view.dart';
import 'app/theme/glass_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'app/utils/import.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krunal Pujara - Mobile Team Lead',
      theme: ThemeData.dark().copyWith(
        primaryColor: GlassTheme.primaryColor,
        scaffoldBackgroundColor: GlassTheme.backgroundColor,
        textTheme: TextTheme(bodyMedium: GlassTheme.body),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(
            GlassTheme.primaryColor.withValues(alpha: 0.3),
          ),
          trackColor: WidgetStateProperty.all(GlassTheme.glassBorder),
          thickness: WidgetStateProperty.all(6),
          radius: const Radius.circular(10),
          interactive: true,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialBinding: HomeBinding(),
      home: const MouseScale(child: HomeView()),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }
}
