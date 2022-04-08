import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/Home/homescreen_page.dart';
import 'package:simpe/screens/payments/paymentscreen.dart';
import 'package:simpe/screens/qrtab/qrscreen.dart';
import 'package:simpe/screens/settings/settiingscreen.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int selecctedTab = 0;



  PageController controller = PageController();
  var tabs = [
    HomePage(),
    PaymentMethods(),
    QrTabScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          // selectedIconTheme: IconThemeData(color: kBlackColor),
          // selectedItemColor: kBlackColor,
          currentIndex: selecctedTab,
          onTap: (tab) {
            setState(() {
              selecctedTab = tab;
              controller.animateToPage(tab,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Home".tr,
                activeIcon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/home-2.svg",
                      color: kBlackColor,
                    )),
                icon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/home-2.svg",
                      color: Color(0XFFACACB0),
                    ))),
            BottomNavigationBarItem(
                label: "Payment".tr,
                activeIcon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/cardavigation.svg",
                      color: kBlackColor,
                    )),
                icon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/cardavigation.svg",
                      color: Color(0XFFACACB0),
                    ))),
            BottomNavigationBarItem(
                label: "QR Code".tr,
                activeIcon: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: SvgPicture.asset(
                    "assets/icons/qrnavigation.svg",
                    color: kBlackColor,
                  ),
                ),
                icon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/qrnavigation.svg",
                      color: Color(0XFFACACB0),
                    ))),
            BottomNavigationBarItem(
                label: "Setting".tr,
                activeIcon: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: SvgPicture.asset(
                    "assets/icons/settingavigation.svg",
                    color: kBlackColor,
                  ),
                ),
                icon: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/settingavigation.svg",
                      color: Color(0XFFACACB0),
                    )))
          ]),
      body:PageView(
        controller: controller,
        onPageChanged: (tt) {
          if(mounted) {
            setState(() {
            selecctedTab = tt;
          });
          }
        },
        children: tabs,
      ),
    );
  }
}
