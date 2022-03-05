// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'tabController.dart';

// class TabScreenPage extends GetView<TabScreenController> {
//   const TabScreenPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TabScreenController());
//     // Get.put(MyTransactionsPageController());
//     return Scaffold(
//         body: SafeArea(
//             child: PersistentTabView(
//       context,
//       controller: controller.persistentTabController,
//       //buyer-seller-screen-changer
//       screens: controller.tabScreensBuyer,
//       items: controller.navBarsItems(),

//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.once,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: false,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style6, // Choose the nav bar style with this property.
//     )));
//   }
// }
