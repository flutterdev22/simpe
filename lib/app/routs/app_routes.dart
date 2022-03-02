import 'package:get/get.dart';
import 'package:simpe/screens/onboarding/onboarding.dart';
import 'package:simpe/screens/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static List<GetPage>? allRoutes = <GetPage>[
    GetPage(
      name: splash,
      page: () => SplashscreenWidget(),
    ),
     GetPage(
      name: onboarding,
      page: () => OnBoardingScreen(),
    ),
  ];
}
