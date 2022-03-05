import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/settings/changepin.dart';
import 'package:simpe/screens/settings/mysimpe_screen.dart';
import 'package:simpe/screens/settings/seetting_controller.dart';
import 'package:simpe/screens/settings/visibilty_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  SettingController controller = Get.put(SettingController());

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
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          elevation: 0,
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Quit",
                    style: TextStyle(
                      color: Color(0xffff5449),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          backgroundColor: Colors.white,
          collapsedHeight: 60.h,
          title: Text(
            "Settings",
            style: TextStyle(
              color: Color(0xff1e1e20),
              fontSize: 24.sp,
              fontFamily: "DMSans",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "My account",
                      style: TextStyle(
                        color: Color(0xccacacb0),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  settiingTile("assets/icons/settings/account-circle.svg",
                      "My Simpe", "How are you identified on the platform", () {
                    Get.to(MySimpeScreen());
                  }),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile("assets/icons/settings/Base-lock.svg",
                      "Visibility", "Visibility", () {
                    Get.to(VisibilityScreen());
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "Security",
                      style: TextStyle(
                        color: Color(0xccacacb0),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  settiingTile("assets/icons/settings/Account-box.svg",
                      "Validate identity", "To use all features", () {
                    Get.to(MySimpeScreen());
                    screenLock(
                      context: context,
                      correctString: '1234',
                    );
                  }),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile("assets/icons/settings/key-2.svg", "Change pin",
                      "Code used to access the application", () {
                    Get.to(ChangePinScreen());
                    // screenLock(
                    //   context: context,
                    //   correctString: '1234',
                    // );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "Language",
                      style: TextStyle(
                        color: Color(0xccacacb0),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  settiingTile("assets/icons/settings/globe.svg", "Language",
                      "Portuguese", () {
                    showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              height: 250.h,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    width: 359.w,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Choose language",
                                      style: TextStyle(
                                        color: Color(0xff1e1e20),
                                        fontSize: 14.sp,
                                        fontFamily: "DMSans",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    width: 327.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Text(
                                              "English",
                                              style: TextStyle(
                                                color: Color(0xff1e1e20),
                                                fontSize: 14,
                                                fontFamily: "DM Sans",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 16,
                                          height: 16,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 16,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Container(
                                    width: 359.w,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    height: 1,
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    width: 327.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Text(
                                              "Portuguese",
                                              style: TextStyle(
                                                color: Color(0xff1e1e20),
                                                fontSize: 14,
                                                fontFamily: "DM Sans",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 16,
                                          height: 16,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 16,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color:
                                                      Colors.grey.withAlpha(0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              ),
                            ));
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "General",
                      style: TextStyle(
                        color: Color(0xccacacb0),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  settiingTile("assets/icons/settings/Simpe.png", "About Simpe",
                      "Terms and Policies", () {}),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile(
                      "assets/icons/settings/clloseaccount.svg",
                      "Close my account",
                      "Deletion of profile and data",
                      () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget settiingTile(icon, title, subtitle, ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff423fff),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          child: icon.toString().contains(".svg")
                              ? SvgPicture.asset(icon)
                              : Image.asset(icon),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff1e1e20),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xccacacb0),
                      fontSize: 12.sp,
                      fontFamily: "DMSans",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              width: 24,
              height: 24,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container searchItemTille(img, text, subtext) {
    return Container(
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0x3dacacb0),
                width: 0.50,
              ),
              color: Color(0xff1e1e20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 39.w,
                  height: 39.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtext,
                  style: TextStyle(
                    color: Color(0xccacacb0),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
