import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/services/reuseableData.dart';
import '../../app/themes/app_colors.dart';
import '../../services/apis.dart';
import '../../services/keys.dart';

class VisibilityScreen extends StatefulWidget {
  VisibilityScreen({Key? key}) : super(key: key);

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
//  SettingController controller = Get.find<SettingController>();

  bool isLoad = false;
  Future<void> updateConfigs() async{

    try{
      var response = await http.put(
        Uri.parse('${Apis.baseUrl}${Apis.users}${reuseableData.username}/configurations'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
        body: jsonEncode(<dynamic, dynamic>{
          "language": reuseableData.language,
          "show_in_searches": reuseableData.showInSearches,
          "receive_via_link": reuseableData.receiveViaLink
        }),
      );

      if (response.statusCode == 204) {
        Get.snackbar("Success", "Updated Successfully!",backgroundColor: Colors.green,colorText: Colors.white);
      }
      else {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Error", "Something went wrong",backgroundColor: Colors.amberAccent,colorText: Colors.white);
        throw Exception("Error");
      }

    } on SocketException {
      if(mounted){
        setState(() {
          isLoad = false;
        });
      }
      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
    } on HttpException {
      if(mounted){
        setState(() {
          isLoad = false;
        });
      }
      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {
      if(mounted){
        setState(() {
          isLoad = false;
        });
      }
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
      body: CustomScrollView(
        slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Visibility".tr,
            style: TextStyle(
              color: const Color(0xff1e1e20),
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
                            "Show in searches".tr,
                            style: TextStyle(
                              color: const Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Activate or deactivate your profile from other users' searches.".tr,
                              style: TextStyle(
                                color: const Color(0xccacacb0),
                                fontSize: 12.sp,
                                fontFamily: "DMSans",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    switch_custom(
                          reuseableData.showInSearches, () {
                        if(mounted) {
                          setState(() {
                          reuseableData.showInSearches = !reuseableData.showInSearches;
                          isLoad=true;
                        });
                        }
                        updateConfigs();
                      }),
                  ],
                ),
              ),
              Container(
                width: 343.w,
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
                            "Receive transfers via link".tr,
                            style: TextStyle(
                              color: const Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Activate or deactivate receiving via link. It will also be reflected in receipts via QR code".tr,
                              style: TextStyle(
                                color: const Color(0xccacacb0),
                                fontSize: 12.sp,
                                fontFamily: "DMSans",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    switch_custom(
                        reuseableData.receiveViaLink, () {
                      if(mounted) {
                        setState(() {
                          reuseableData.receiveViaLink = !reuseableData.receiveViaLink;
                          isLoad=true;
                        });
                      }
                      updateConfigs();
                    }),
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
          color: on ? const Color(0xff4a5aff) : const Color(0xFFACACB0),
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

