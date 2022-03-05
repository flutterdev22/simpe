import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/themes/app_colors.dart';
import '../trransfer/success.dart';

class QrTabScreen extends StatelessWidget {
  const QrTabScreen({Key? key}) : super(key: key);

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
        // SliverAppBar(
        //   automaticallyImplyLeading: false,
        //   iconTheme: IconThemeData(
        //     color: kBlackColor, //change your color here
        //   ),
        //   pinned: true,
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     "Payment methods",
        //     style: TextStyle(
        //       color: Color(0xff1e1e20),
        //       fontSize: 24.sp,
        //       fontFamily: "DMSans",
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              // SizedBox(
              //   height: 24.h,
              // ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 327.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 327.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 327.w,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "My QR code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff1e1e20),
                                          fontSize: 24.sp,
                                          fontFamily: "DMSans",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "Show the QR code to\nreceive a transfer",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xccacacb0),
                                          fontSize: 14.sp,
                                          fontFamily: "DMSans",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 327.w,
                    height: 451.h,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 191.69.w,
                              height: 191.h,
                              child: Image.asset("assets/imges/image 1.png"),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          "@diogo.murano",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 24.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff4a5aff),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Transfer to someone via QR code",
                            style: TextStyle(
                              color: Color(0xfffcfcfc),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Color(0xff423fff),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                      "assets/icons/Arrow-share-forward (1).png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: Color(0xff423fff),
                              fontSize: 14,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        )
      ]),
    );
  }
}
