import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/Enterance/mainScreen.dart';
import 'package:simpe/screens/Enterance/passcodeScreen.dart';

import 'onboardingcontroller.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  @override
  final controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 750),
      context: context,
      minTextAdapt: true,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 120.h,
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller.controllerPage,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  onPageChanged: (value) {
                    controller.currentIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    return pageViwer(controller.titles[index],
                        controller.descs[index], index);
                  }),
            ),
            SizedBox(height: 24.h),
            Obx(
              () => Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 37.3333320617675,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9999),
                            topRight: Radius.circular(9999),
                            bottomLeft: Radius.circular(9999),
                            bottomRight: Radius.circular(9999),
                          ),
                          color: controller.currentIndex == 0
                              ? Color.fromRGBO(74, 90, 255, 1)
                              : Color.fromRGBO(
                                  172, 172, 176, 0.23999999463558197),
                        ),
                        child: Stack(children: <Widget>[])),
                    SizedBox(width: 4.w),
                    Container(
                        width: 37.33333206176758,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9999),
                            topRight: Radius.circular(9999),
                            bottomLeft: Radius.circular(9999),
                            bottomRight: Radius.circular(9999),
                          ),
                          color: controller.currentIndex == 1
                              ? Color.fromRGBO(74, 90, 255, 1)
                              : Color.fromRGBO(
                                  172, 172, 176, 0.23999999463558197),
                        ),
                        child: Stack(children: <Widget>[])),
                    SizedBox(width: 4.w),
                    Container(
                        width: 37.33333206176758,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9999),
                            topRight: Radius.circular(9999),
                            bottomLeft: Radius.circular(9999),
                            bottomRight: Radius.circular(9999),
                          ),
                          color: controller.currentIndex == 2
                              ? Color.fromRGBO(74, 90, 255, 1)
                              : Color.fromRGBO(
                                  172, 172, 176, 0.23999999463558197),
                        ),
                        child: Stack(children: <Widget>[])),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  if (controller.currentIndex.value == 2) {
                    Get.to(MainScreen());
                  }
                  if (controller.currentIndex.value < 3) {
                    // controller.currentIndex += 1;
                    controller.controllerPage.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                  // // if (controller.currentIndex.value == 2) {
                  // //   screenLock(
                  // //     title: Text(
                  // //       'Insira seu pin',
                  // //       style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  // //     ),
                  // //     context: context,
                  // //     correctString: '1234',
                  // //     customizedButtonChild: Icon(
                  // //       Icons.fingerprint,
                  // //       color: Colors.red,
                  // //     ),
                  // //     didUnlocked: () {
                  // //       MainScreen.show(context);
                  // //     },
                  // //     customizedButtonTap: () async {
                  // //       await localAuth(context);
                  // //     },
                  // //     didOpened: () async {
                  // //       await localAuth(context);
                  // //     },
                  // //     screenLockConfig: ScreenLockConfig(
                  // //       backgroundColor: Colors.white,
                  // //     ),
                  // //     secretsConfig: SecretsConfig(
                  // //       spacing: 15, // or spacingRatio
                  // //       padding: const EdgeInsets.all(40),
                  // //       secretConfig: SecretConfig(
                  // //         borderColor: kBlueColor,
                  // //         borderSize: 2.0,
                  // //         disabledColor: Colors.white,
                  // //         enabledColor: kBlueColor,
                  // //         height: 15,
                  // //         width: 15,
                  // //         build: (context,
                  // //             {required config, required enabled}) {
                  // //           return SizedBox(
                  // //             child: Container(
                  // //               decoration: BoxDecoration(
                  // //                 shape: BoxShape.circle,
                  // //                 color: enabled
                  // //                     ? config.enabledColor
                  // //                     : config.disabledColor,
                  // //                 border: Border.all(
                  // //                   width: config.borderSize,
                  // //                   color: config.borderColor,
                  // //                 ),
                  // //               ),
                  // //               padding: EdgeInsets.all(10),
                  // //               width: config.width,
                  // //               height: config.height,
                  // //             ),
                  // //             width: config.width,
                  // //             height: config.height,
                  // //           );
                  // //         },
                  // //       ),
                  // //     ),
                  // //     inputButtonConfig: InputButtonConfig(
                  // //       textStyle:
                  // //           InputButtonConfig.getDefaultTextStyle(context)
                  // //               .copyWith(
                  // //                   fontWeight: FontWeight.normal,
                  // //                   color: Colors.black),
                  // //       buttonStyle: OutlinedButton.styleFrom(
                  // //           shape: const RoundedRectangleBorder(),
                  // //           backgroundColor: Colors.grey.shade300,
                  // //           minimumSize: Size(200, 100),
                  // //           padding: EdgeInsets.all(15)),
                  // //     ),
                  // //     cancelButton: const Icon(
                  // //       Icons.close,
                  // //       color: Colors.black,
                  // //     ),
                  // //     deleteButton: const Icon(
                  // //       Icons.delete,
                  // //       color: Colors.black,
                  // //     ),
                  // //   ); // MainScreen());
                  // }
                },
                child: Container(
                  width: 343.w,
                  height: 44.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: kBlueColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Center(
                    child: Text(
                      controller.currentIndex.value <= 1
                          ? 'Continue'
                          : "Continue",
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
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Please authenticate');
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  Widget pageViwer(title, desc, i) {
    var imgs = [
      "assets/icons/Group 1.png",
      "assets/icons/Group.png",
      "assets/icons/good profit.png"
    ];
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 351.w,
            height: 285.h,
            child: Image.asset(imgs[i]),
          ),
          SizedBox(height: 68.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(30, 30, 32, 1),
                fontFamily: 'DM Sans',
                fontSize: 32,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w500,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          SizedBox(height: 16.h),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(172, 172, 176, 0.800000011920929),
                fontFamily: 'DM Sans',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
        ],
      ),
    );
  }
}
