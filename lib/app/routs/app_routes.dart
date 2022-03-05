import 'package:get/get.dart';
import 'package:simpe/screens/Home/tabs_view.dart';
import 'package:simpe/screens/onboarding/onboarding.dart';
import 'package:simpe/screens/splash/splash_screen.dart';

import '../../screens/Home/homescreen_page.dart';
import '../../screens/trransfer/transferscreen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String homepage = '/homepage';
  static const String transferscreeeen = '/transferscreeeen';

  static List<GetPage>? allRoutes = <GetPage>[
    GetPage(
      name: splash,
      page: () => SplashscreenWidget(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: homepage,
      page: () => TabView(),
    ),
    GetPage(
      name: transferscreeeen,
      page: () => TransferScreen(),
    ),
  ];
}
