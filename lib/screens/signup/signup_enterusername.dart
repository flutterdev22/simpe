import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/login/enter_pin.dart';
import 'package:simpe/screens/login/login_controller.dart';
import 'package:simpe/screens/login/otp_screen.dart';
import 'package:simpe/screens/signup/signup_otp_screen.dart';

class SignupEnterUsername extends StatelessWidget {
  SignupEnterUsername({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());

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
      // resizeToAvoidBottomInset: false,
      bottomSheet: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: InkWell(
            onTap: () {
              Get.to(SignupOtpScreen());
            },
            child: Container(
              width: 343.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: controller.username.isEmpty
                    ? Color(0xcce9ebec)
                    : Color(0xff4a5aff),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      color: controller.username.isEmpty
                          ? Color(0xccacacb0)
                          : Color(0xfffcfcfc),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBlackColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Choose your username",
          style: TextStyle(
            color: Color(0xff1e1e20),
            fontSize: 14.sp,
            fontFamily: "DMSans",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: SvgPicture.asset("assets/icons/at_black.svg"),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 100.h,
              child: TextFormField(
                autofocus: true,
                onChanged: (v) {
                  controller.username.value = v;
                },
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 14.sp,
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "username",
                  hintStyle: TextStyle(
                    color: Color(0xff1e1e20),
                    fontFamily: "DMSans",
                    fontSize: 18.sp,
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
