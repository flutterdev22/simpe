import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/themes/app_colors.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

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
            "Add card",
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
                  "Card name",
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
                  "Card number",
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
                      child: Image.asset(
                        "assets/icons/Mastercardsmall.png",
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
                          hintText: "4041 2947 8335 2917",
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
                  "Validity",
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
                    hintText: "05/23",
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
                  "CVV",
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
                    hintText: "274",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {
                    Get.back();
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
