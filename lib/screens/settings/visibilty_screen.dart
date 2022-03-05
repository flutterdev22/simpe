import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/screens/settings/seetting_controller.dart';

import '../../app/themes/app_colors.dart';

class VisibilityScreen extends StatelessWidget {
  VisibilityScreen({Key? key}) : super(key: key);
  SettingController controller = Get.find<SettingController>();

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
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Visibility",
            style: TextStyle(
              color: Color(0xff1e1e20),
              fontSize: 24.sp,
              fontFamily: "DMSans",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 343.w,
                // height: 71.h,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Show in searches",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 2),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Activate or deactivate your profile from other users' searches.",
                              style: TextStyle(
                                color: Color(0xccacacb0),
                                fontSize: 12.sp,
                                fontFamily: "DMSans",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Obx(
                      () => switch_custom(controller.showiinsearch.value, () {
                        controller.showiinsearch.toggle();
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                width: 343.w,
                // height: 71.h,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Receive transfers via link",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 2),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Activate or deactivate receiving via link. It will also be reflected in receipts via QR code",
                              style: TextStyle(
                                color: Color(0xccacacb0),
                                fontSize: 12.sp,
                                fontFamily: "DMSans",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Obx(
                      () => switch_custom(controller.recivelink.value, () {
                        controller.recivelink.toggle();
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget switch_custom(bool on, ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 44.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: on ? Color(0xff4a5aff) : Color(0xFFACACB0),
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              on ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getTextField(title, hint) {
  return Column(
    children: [
      SizedBox(
        width: 327.w,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xccacacb0),
            fontSize: 14,
            fontFamily: "DMSans",
          ),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Container(
        width: 327.w,
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xcce9ebec),
            width: 1,
          ),
          color: Color(0xcce9ebec),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diogo Murano",
                    style: TextStyle(
                      color: Color(0xff1e1e20),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
