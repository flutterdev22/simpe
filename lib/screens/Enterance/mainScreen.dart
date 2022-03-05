import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/Home/homescreen_page.dart';
import 'package:simpe/screens/Tabview/tabscreen.dart';

import '../Home/tabs_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static show(BuildContext context) {
    Get.to(() => MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 120.h,
        ),
        Expanded(child: getscreen()),
        SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 343.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border.all(width: 1, color: kBlueColor),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Center(
              child: Text(
                'Criar conta',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kBlueColor,
                    fontSize: 14.sp,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.5 /*PERCENT not supported*/
                    ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => TabView());
          },
          child: Container(
            width: 343.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: kBlueColor,
              // borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Center(
              child: Text(
                'Entrar',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(252, 252, 252, 1),
                    fontSize: 14.sp,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.5 /*PERCENT not supported*/
                    ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
      ]),
    ));
  }

  Widget getscreen() {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 351.w,
            height: 285.h,
            child: Image.asset("assets/icons/save.png"),
          ),
          SizedBox(height: 68.h),
          const Text(
            'Simpe',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(30, 30, 32, 1),
                fontSize: 32,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w500,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          SizedBox(height: 16.h),
          const Text(
            "A forma mais facil de transferir ou mandar dinheiro!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(172, 172, 176, 0.800000011920929),
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
