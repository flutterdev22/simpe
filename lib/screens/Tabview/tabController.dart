// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:simpe/app/themes/app_colors.dart';
// import 'package:simpe/screens/splash/splash_screen.dart';

// import '../Home/homescreen_page.dart';

// class TabScreenController extends GetxController {
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }

//   var currentIndex = 0.obs;
//   var isCurrentUserBuyer = true.obs;
//   PageController pageController = PageController();

//   PersistentTabController persistentTabController =
//       PersistentTabController(initialIndex: 0);

//   List<PersistentBottomNavBarItem> navBarsItems() {
//     return [
//       tabItem(
//         '',
//         icon: Image.asset("assets/icons/home.png"),
//       ),
//       tabItem(
//         '',
//         icon: Image.asset("assets/icons/brefecase.png"),
//       ),
//       tabItem(
//         '',
//         icon: Image.asset("assets/icons/qr.png"),
//       ),
//       tabItem(
//         '',
//         icon: Image.asset("assets/icons/setting.png"),
//       ),
//     ];
//   }

//   setCurrentUserToSeller() {
//     isCurrentUserBuyer.value = false;
//   }

//   setCurrentUserToBuyer() {
//     isCurrentUserBuyer.value = true;
//   }

//   PersistentBottomNavBarItem tabItem(title, {required Widget icon, screen}) {
//     return PersistentBottomNavBarItem(
//       textStyle: TextStyle(
//         fontSize: 10.sp,
//       ),
//       icon: icon,
//       activeColorPrimary: kBlackColor,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     );
//   }

//   List<Widget> tabScreensBuyer = [
//     HomePage(), //Home
//     HomePage(), //Home

//     HomePage(), //Home
//     HomePage(), //Home

//     // MyTransactionsPage(), //My Transactions
//     // NotificationsPage(), //Notifications
//     // ProfilePage(), //My Account
//   ];

//   get getcurrentIndex => currentIndex;
//   changeCurrentIndex(int index) {
//     currentIndex.value = index;
//     persistentTabController.index = index;
//   }
// }
