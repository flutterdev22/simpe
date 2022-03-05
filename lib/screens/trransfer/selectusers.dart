import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/trransfer/transferprofille.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

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
          iconTheme: IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Transfer/username",
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
            child: Column(children: [
              Container(
                width: 327.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0x3dacacb0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
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
                              prefixIcon: SizedBox(
                                  width: 16.w,
                                  height: 16.h,
                                  child: SvgPicture.asset(
                                    "assets/icons/search.svg",
                                    fit: BoxFit.scaleDown,
                                  )),
                              hintStyle: TextStyle(
                                color: Color(0xccacacb0),
                                fontSize: 14.sp,
                                fontFamily: "DMSans",
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "search username"),
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Recent",
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                InkWell(
                  onTap: () {
                    Get.to(TransferProfile());
                  },
                  child: searchItemTille("assets/imges/Logo (1).png",
                      "@julia.belem", "Júlia Belém"),
                ),
                searchItemTille("assets/imges/Logo (2).png", "Laura Almeida",
                    "Júlia Belém"),
                searchItemTille(
                    "assets/imges/Logo.png", "@gustavo.alves", "Gustavo Alves")
              ],
            ),
          ),
        ),
      ]),
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

  Container itemTille(icon, msg) {
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
                  height: 24.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(icon)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg,
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 24.w,
            height: 24.h,
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
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
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
