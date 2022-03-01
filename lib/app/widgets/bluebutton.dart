import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget blueButton(context) {
  ScreenUtil.init(
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
    // designSize: const Size(375, 812),
    context: context,
    minTextAdapt: true,
  );
  return // Figma Flutter Generator ButtonsWidget - INSTANCE
      Container(
          width: 343,
          height: 44,
          child: Stack(children: [
            Positioned(
                top: 12,
                left: 138.5,
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
                )),
          ]));
}
