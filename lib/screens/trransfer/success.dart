import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/Home/homescreen_page.dart';
import 'package:simpe/screens/Home/tabs_view.dart';

class SuccessTransfer extends StatelessWidget {
  const SuccessTransfer({Key? key}) : super(key: key);

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
      backgroundColor: Color(0xFF423FFF),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: kPrimaryColor,
              size: 100,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Transfer made successfully".tr,
              style: TextStyle(
                color: Color(0xfffcfcfc),
                fontSize: 24.sp,
                fontFamily: "DMSans",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {
                  Get.offAll(TabView());
                },
                child: Container(
                  width: double.infinity,
                  color: Color(0xa3fcfcfc),
                  child: Container(
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFCFCFC),
                    ),
                    child: Center(
                      child: Text(
                        "Go back".tr,
                        style: TextStyle(
                          color: Color(0xFF423FFF),
                          fontSize: 14.sp,
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
