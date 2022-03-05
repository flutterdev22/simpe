import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/screens/signup/signup_enterusername.dart';

import '../../app/themes/app_colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InkWell(
          onTap: () {
            Get.to(SignupEnterUsername());
          },
          child: Container(
            width: double.infinity,
            color: Color(0xa3fcfcfc),
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff4a5aff),
              ),
              child: Center(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Color(0xfffcfcfc),
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
      backgroundColor: Colors.white,
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
          backgroundColor: Colors.white,
          title: Text(
            "Create account",
            style: TextStyle(
              color: Color(0xff1e1e20),
              fontSize: 14.sp,
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
                  "Name",
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
                    hintText: "Diogo Murano",
                    hintStyle: TextStyle(
                      color: Color(0xff1e1e20),
                      fontFamily: "DMSans",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Email",
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
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
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
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Phone number",
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
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Country",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        icon: SizedBox.shrink(),
                        hint: Text(
                          "EUA",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        items: <String>['EUA', 'EUA', 'EUA', 'EUA']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Currency",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        icon: SizedBox.shrink(),
                        hint: Text(
                          "USD",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        items: <String>['USD', 'PKR'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        icon: SizedBox.shrink(),
                        hint: Text(
                          "English",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        items: <String>[
                          'English',
                          'Portugal',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 150.h,
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
