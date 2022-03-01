import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      // designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 120.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: <Widget>[
                    PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        pageViwer(
                            "Instantâneo!",
                            "Não leva nem um segundo fazer transferências na Simpe",
                            0),
                        pageViwer(
                            "Instantâneo!",
                            "Não leva nem um segundo fazer transferências na Simpe",
                            1),
                        pageViwer(
                            "Instantâneo!",
                            "Não leva nem um segundo fazer transferências na Simpe",
                            2),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Container(
                      width: 375.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Color.fromRGBO(74, 90, 255, 1),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Center(
                        child: Text(
                          'Continuar',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(252, 252, 252, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            style: TextStyle(
                color: Color.fromRGBO(30, 30, 32, 1),
                fontFamily: 'DM Sans',
                fontSize: 32,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          SizedBox(height: 16.h),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(172, 172, 176, 0.800000011920929),
                fontFamily: 'DM Sans',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: 37.3333320617675,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9999),
                        topRight: Radius.circular(9999),
                        bottomLeft: Radius.circular(9999),
                        bottomRight: Radius.circular(9999),
                      ),
                      color: i == 0
                          ? Color.fromRGBO(74, 90, 255, 1)
                          : Color.fromRGBO(172, 172, 176, 0.23999999463558197),
                    ),
                    child: Stack(children: <Widget>[])),
                SizedBox(width: 4.w),
                Container(
                    width: 37.33333206176758,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9999),
                        topRight: Radius.circular(9999),
                        bottomLeft: Radius.circular(9999),
                        bottomRight: Radius.circular(9999),
                      ),
                      color: i == 1
                          ? Color.fromRGBO(74, 90, 255, 1)
                          : Color.fromRGBO(172, 172, 176, 0.23999999463558197),
                    ),
                    child: Stack(children: <Widget>[])),
                SizedBox(width: 4.w),
                Container(
                    width: 37.33333206176758,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9999),
                        topRight: Radius.circular(9999),
                        bottomLeft: Radius.circular(9999),
                        bottomRight: Radius.circular(9999),
                      ),
                      color: i == 2
                          ? Color.fromRGBO(74, 90, 255, 1)
                          : Color.fromRGBO(172, 172, 176, 0.23999999463558197),
                    ),
                    child: Stack(children: <Widget>[])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
