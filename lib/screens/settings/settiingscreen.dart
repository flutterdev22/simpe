import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/login/login_screen.dart';
import 'package:simpe/screens/settings/changepin.dart';
import 'package:simpe/screens/settings/mysimpe_screen.dart';
import 'package:simpe/screens/settings/seetting_controller.dart';
import 'package:simpe/screens/settings/visibilty_screen.dart';
import 'package:simpe/services/reuseableData.dart';

import '../../services/apis.dart';
import '../../services/keys.dart';


class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController controller = Get.put(SettingController());

  Future<void> updateConfigs(String language) async{

    try{
      var response = await http.put(
        Uri.parse('${Apis.baseUrl}${Apis.users}${reuseableData.username}/configurations'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
        body: jsonEncode(<dynamic, dynamic>{
          "language": language,
        }),
      );

      if (response.statusCode == 204) {
        if(mounted){
          setState(() {
            reuseableData.language = language;
          });
        }
        Get.snackbar("Success", "Updated Successfully!",backgroundColor: Colors.green,colorText: Colors.white);
      }
      else {

        Get.snackbar("Error", "Something went wrong",backgroundColor: Colors.amberAccent,colorText: Colors.white);
        throw Exception("Error");
      }

    } on SocketException {

      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
    } on HttpException {

      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {

      Get.snackbar("Error", "Bad response format 👎",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    }
  }

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
            GestureDetector(
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if(mounted){
                  setState(() {
                    reuseableData.username ="";
                    reuseableData.email = "";
                    reuseableData.phone = "";
                    reuseableData. balance = "";
                    reuseableData. country = "";
                    reuseableData. currency = "";
                    reuseableData.language = "";
                    reuseableData. qrcode = "";
                    reuseableData. showInSearches= false;
                    reuseableData.receiveViaLink= false;
                    reuseableData.token = "";
                    reuseableData.pin = "";
                  });
                }
                prefs.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                        (route) => false);
               Get.snackbar("Success", "Logout Success.",colorText: Colors.white,backgroundColor: Colors.green);


              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Quit".tr,
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
            "Settings".tr,
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
                      "My account".tr,
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
                      "My Simpe", "How are you identified on the platform".tr, () {
                        Get.to(() => MySimpeScreen());

                  }),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile("assets/icons/settings/Base-lock.svg",
                      "Visibility".tr, "Visibility".tr, () {
                        Get.to(() => VisibilityScreen());

                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "Security".tr,
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
                      "Validate identity".tr, "To use all features".tr, () {

                    Get.to(() => MySimpeScreen());
                 
                  }),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile("assets/icons/settings/key-2.svg", "Change pin".tr,
                      "Code used to access the application".tr, () {
                        Get.to(() => ChangePinScreen());
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
                      "Language".tr,
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
                  settiingTile("assets/icons/settings/globe.svg", "Language".tr,
                      reuseableData.language, () {

                        Get.bottomSheet(
                          SizedBox(
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
                                    "Choose language".tr,
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
                                GestureDetector(
                                  onTap: (){
                                    Get.updateLocale(Locale('en', 'US'));
                                    updateConfigs("en-us");
                                  },
                                  child: Container(
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
                                              "English".tr,
                                              style: TextStyle(
                                                color: Color(0xff1e1e20),
                                                fontSize: 14.sp,
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
                                                  color: Colors.grey.withAlpha(0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                GestureDetector(
                                  onTap: (){
                                    Get.updateLocale(Locale('pt', 'BR'));
                                    updateConfigs("pt-br");
                                  },
                                  child: Container(
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
                                              "Portuguese".tr,
                                              style: TextStyle(
                                                color: Color(0xff1e1e20),
                                                fontSize: 14.sp,
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
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 350,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFCFCFC),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius:5,
                                            color: Colors.black.withOpacity(0.25),
                                          )
                                        ]
                                    ),
                                    child: Center(child: Text("Cancel")),
                                  ),
                                )
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                          barrierColor: Colors.black.withOpacity(0.25),
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                          ),
                          enableDrag: false,

                        );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      "General".tr,
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


                  settiingTile("assets/icons/settings/Simpe.png", "About Simpe".tr,
                      "Terms and Policies".tr, () {

                        Get.bottomSheet(
                          SizedBox(
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
                                    "About Simpe".tr,
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
                                            "Privacy Policy".tr,
                                            style: TextStyle(
                                              color: Color(0xff1e1e20),
                                              fontSize: 14.sp,
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
                                                color: Colors.grey.withAlpha(0),
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
                                            "Terms of use".tr,
                                            style: TextStyle(
                                              color: Color(0xff1e1e20),
                                              fontSize: 14.sp,
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
                                GestureDetector(
                                  onTap: (){
                                   Get.back();
                                  },
                                  child: Container(
                                    width: 350,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFCFCFC),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius:5,
                                            color: Colors.black.withOpacity(0.25),
                                          )
                                        ]
                                    ),
                                    child: Center(child: Text("Cancel")),
                                  ),
                                )
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                          barrierColor: Colors.black.withOpacity(0.25),
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enableDrag: false,

                        );
                      }),
                  SizedBox(
                    height: 5.h,
                  ),
                  settiingTile(
                      "assets/icons/settings/clloseaccount.svg",
                      "Close my account".tr,
                      "Deletion of profile and data".tr,
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
    return GestureDetector(
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
