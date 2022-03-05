import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:simpe/app/routs/app_routes.dart';
import 'package:simpe/screens/Home/addbalance.dart';
import 'package:simpe/screens/Home/withdrawbalance.dart';

import '../../app/themes/app_colors.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            collapsedHeight: 250.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/imges/Balance.png",
                          fit: BoxFit.fill,
                          height: 200.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(left: 32.w, top: 64.h, child: getText()),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 80.h,
                        decoration: BoxDecoration(color: KBackground),
                      )),
                  Positioned(
                      left: 0.w,
                      bottom: 32.h,
                      right: 0,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 59.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.transferscreeeen);
                                },
                                child: getIconHeader(
                                    "assets/icons/Vector.png", "transferir"),
                              ),
                              InkWell(
                                onTap: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => AddBalance(),
                                  );
                                },
                                child: getIconHeader(
                                    "assets/icons/Vector (1).png", "adicionar"),
                              ),
                              InkWell(
                                onTap: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => WithDrawBalance(),
                                  );
                                },
                                child: getIconHeader(
                                    "assets/icons/Vector (2).png", "sacar"),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Últimas transações',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(30, 30, 32, 1),
                        fontFamily: 'DMSans',
                        fontSize: 14.sp,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                  // Figma
                  //SizFlutter Generator Terafeira15defevde2022Widget - TEXT
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: Text(
                      'Terça feira, 15 de fev de 2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:
                              Color.fromRGBO(172, 172, 176, 0.800000011920929),
                          fontFamily: 'DMSans',
                          fontSize: 12.sp,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5 /*PERCENT not supported*/
                          ),
                    ),
                  ),
                  customListtille(
                      img: "assets/imges/Logo.png",
                      text: "@julia.belem",
                      subtext: "Júlia Belém",
                      amount: 329.47,
                      pointamout: "47"),

                  customListtille(
                      img: "assets/imges/Logo (2).png",
                      text: "@rafael.silva",
                      subtext: "Rafael Silva",
                      amount: -231.47,
                      pointamout: "47"),
                  customListtille(
                      img: "assets/imges/Logo.png",
                      text: "@julia.belem",
                      subtext: "Júlia Belém",
                      amount: 329.47,
                      pointamout: "47"),

                  // Figma Flutter Generator Frame17Widget - FRAME - VERTICAL
                  Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            color: Color.fromRGBO(66, 63, 255, 1),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: SvgPicture.asset(
                                      "assets/icons/user-add.svg")),
                              SizedBox(width: 16),
                              Container(
                                width: 270.w,
                                height: 40.h,
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Ganhe R\$ 29,99 ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(252, 252, 252, 1),
                                          fontFamily: 'DMSans',
                                          fontSize: 14.sp,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Basta convidar seus amigos. Oferta limitada!',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(252, 252, 252,
                                              0.6399999856948853),
                                          fontFamily: 'DMSans',
                                          fontSize: 12.sp,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0),
                        Container(
                          width: 270.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment(
                                    -0.48788055777549744, 0.512119472026825),
                                end: Alignment(
                                    -0.512119472026825, -0.5121194124221802),
                                colors: [
                                  Color.fromRGBO(83, 121, 255, 1)
                                      .withOpacity(0.24),
                                  Color.fromRGBO(64, 60, 255, 1)
                                      .withOpacity(0.24)
                                ]),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 90, vertical: 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[],
                          ),
                        ),
                      ],
                    ),
                  ),

                  customListtille(
                      img: "assets/imges/Logo (2).png",
                      text: "@rafael.silva",
                      subtext: "Rafael Silva",
                      amount: -231.47,
                      pointamout: "47"),
                  customListtille(
                      img: "assets/imges/Logo.png",
                      text: "@julia.belem",
                      subtext: "Júlia Belém",
                      amount: 329.47,
                      pointamout: "47"),

                  customListtille(
                      img: "assets/imges/Logo (2).png",
                      text: "@rafael.silva",
                      subtext: "Rafael Silva",
                      amount: -231.47,
                      pointamout: "47"),

                  customListtille(
                      img: "assets/imges/Logo.png",
                      text: "@julia.belem",
                      subtext: "Júlia Belém",
                      amount: 329.47,
                      pointamout: "47"),

                  customListtille(
                      img: "assets/imges/Logo (2).png",
                      text: "@rafael.silva",
                      subtext: "Rafael Silva",
                      amount: -231.47,
                      pointamout: "47"),
                  customListtille(
                      img: "assets/imges/Logo.png",
                      text: "@julia.belem",
                      subtext: "Júlia Belém",
                      amount: 329.47,
                      pointamout: "47"),

                  customListtille(
                      img: "assets/imges/Logo (2).png",
                      text: "@rafael.silva",
                      subtext: "Rafael Silva",
                      amount: -231.47,
                      pointamout: "47")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile customListtille({img, text, subtext, double? amount, pointamout}) {
    return ListTile(
      onTap: () {},
      leading: SizedBox(
          width: 40.h,
          height: 40.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ))),
      title: // Figma Flutter Generator TitleWidget - TEXT
          Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(30, 30, 32, 1),
            fontFamily: 'DMSans',
            fontSize: 14.sp,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.w500,
            height: 1.5 /*PERCENT not supported*/
            ),
      ),
      subtitle: // Figma Flutter Generator SubtextWidget - TEXT
          Text(
        subtext,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(172, 172, 176, 0.800000011920929),
            fontFamily: 'DMSans',
            fontSize: 12.sp,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1.5 /*PERCENT not supported*/
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            amount! > 0 ? "+" : "-",
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    amount > 0 ? kGreenColor2 : Color.fromRGBO(30, 30, 32, 1),
                fontFamily: 'DMSans',
                fontSize: 16.sp,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w500,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          Text(
            "R\$ " + amount.abs().toString().split(".")[0].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    amount > 0 ? kGreenColor2 : Color.fromRGBO(30, 30, 32, 1),
                fontFamily: 'DMSans',
                fontSize: 16.sp,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w500,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          // Figma Flutter Generator AmountWidget - TEXT
          Text(
            " ," + amount.toString().split(".")[1].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: amount > 0
                    ? kGreenColor2
                    : Color.fromRGBO(172, 172, 176, 0.800000011920929),
                fontFamily: 'DMSans',
                fontSize: 10.sp,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          )
        ],
      ),
    );
  }

  Widget getIconHeader(icon, text) {
    return // Figma Flutter Generator Component1Widget - INSTANCE
        Column(
      children: [
        Container(
          width: 70.h,
          height: 70.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.w),
            ),
            color: kPrimaryColor,
            child: Image.asset(
              icon,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(13, 31, 34, 1),
              fontFamily: 'DMSans',
              fontSize: 14.sp,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w500,
              height: 1.5 /*PERCENT not supported*/
              ),
        ),
      ],
    );
  }

  Widget getText() {
    return // Figma Flutter Generator Frame76Widget - FRAME - VERTICAL
        Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Valor disponível',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'DMSans',
              fontSize: 16.sp,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.5 /*PERCENT not supported*/
              ),
        ),
        SizedBox(height: 0),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'R\$ 875,21',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'DMSans',
                    fontSize: 35.sp,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1.5 /*PERCENT not supported*/
                    ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.visibility_outlined,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
