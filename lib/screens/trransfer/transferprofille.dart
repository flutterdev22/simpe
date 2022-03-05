import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/trransfer/linktransfer.dart';
import 'package:simpe/screens/trransfer/qrtrrasnfer.dart';
import 'package:simpe/screens/trransfer/selectusers.dart';
import 'package:simpe/screens/trransfer/success.dart';

class TransferProfile extends StatelessWidget {
  const TransferProfile({Key? key}) : super(key: key);

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InkWell(
          onTap: () {
            Get.to(SuccessTransfer());
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
                  "Transfer",
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
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          collapsedHeight: 100.h,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          backgroundColor: Colors.transparent,
        ),
        SliverToBoxAdapter(
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                width: 327.w,
                child: Text(
                  "Transferring to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 24.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      "assets/imges/istockphoto-1300972574-170667a.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "@julia.belem",
                style: TextStyle(
                  color: Color(0xff1e1e20),
                  fontSize: 16.sp,
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "Transfer value",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 16.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        getTextField(),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "Will be converted to",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 16.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        getTextField2(),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "1 real = 0.19 dollars.",
                            style: TextStyle(
                              color: Color(0xccacacb0),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: 327.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fee of 1.32 real",
                                style: TextStyle(
                                  color: Color(0xff1e1e20),
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "Effective instantly",
                                style: TextStyle(
                                  color: Color(0xff1e1e20),
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "Julia will receive R\$ 219,43",
                                style: TextStyle(
                                  color: Color(0xff1e1e20),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "Choose payment method",
                            style: TextStyle(
                              color: Color(0xccacacb0),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset("assets/icons/appicon.png"),
                          title: Text(
                            "Balance",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/icons/unselect.png")),
                          subtitle: Text(
                            "\$ 875,21",
                            style: TextStyle(
                              color: Color(0xcc1e1e20),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset("assets/icons/cardicon.png"),
                          title: Text(
                            "Balance",
                            style: TextStyle(
                              color: Color(0xff1e1e20),
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/icons/seleccted.png")),
                          subtitle: Text(
                            "\$ 875,21",
                            style: TextStyle(
                              color: Color(0xcc1e1e20),
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        SliverToBoxAdapter(
          child: Column(children: [
            SizedBox(height: 50.h),
          ]),
        )
      ]),
    );
  }

  Widget getTextField() {
    return Container(
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
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Dollars",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 16.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Color(0xccacacb0),
                        )
                      ],
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xccacacb0),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: "42.73"),
              )),
        ],
      ),
    );
  }

  Widget getTextField2() {
    return Container(
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
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Real",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 16.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: Color(0xccacacb0),
                        )
                      ],
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xccacacb0),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: "219,43"),
              )),
        ],
      ),
    );
  }

  Widget itemTille(icon, msg, ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
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
      ),
    );
  }
}
