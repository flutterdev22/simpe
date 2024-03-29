import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpe/services/reuseableData.dart';
import '../../app/themes/app_colors.dart';

class MySimpeScreen extends StatefulWidget {
  const MySimpeScreen({Key? key}) : super(key: key);

  @override
  State<MySimpeScreen> createState() => _MySimpeScreenState();
}

class _MySimpeScreenState extends State<MySimpeScreen> {
  TextEditingController username= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController phone= TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    log(reuseableData.pin.toString());
  }

  void getUserData() async{
    if(mounted){
      setState(() {
        username.text = reuseableData.username;
        email.text = reuseableData.email;
        phone.text = reuseableData.phone;
      });
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
            "My Simpe".tr,
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
              SizedBox(
                width: 327.w,
                child: Text(
                  "Username".tr,
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
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          "assets/icons/settings/at.svg",
                          color: Color(0xFF423FFF),
                        )),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
                        controller: username,
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
                          hintText: "diogo.murano",
                          hintStyle: TextStyle(
                            color: Color(0xff1e1e20),
                            fontFamily: "DMSans",
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "For any interaction with Simpe users, report your username. That's why they will find you".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Email".tr,
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
                ),
                child: TextFormField(
                  controller: email,
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
                    hintText: "dominguesmurano@gmail.com",
                    hintStyle: TextStyle(
                      color: Color(0xff1e1e20),
                      fontFamily: "DMSans",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Email is used to access your account or recover your password.".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Phone number".tr,
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
                ),
                child: TextFormField(
                  controller: phone,
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
                    hintText: "+55 (11) 96365-9952",
                    hintStyle: TextStyle(
                      color: Color(0xff1e1e20),
                      fontFamily: "DMSans",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Mobile number linked to your Simpe account".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        )
      ]),
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
                      fontSize: 14.sp,
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
