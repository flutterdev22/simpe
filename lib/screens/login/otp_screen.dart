import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:http/http.dart' as http;

import '../../services/apis.dart';
import '../../services/keys.dart';
import 'enter_pin.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController email = TextEditingController();
  String ticket = "";
  bool isLoad = false;

  Future<void> recoverCode(String email) async{

    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.recover}'),
        headers: {
          "Content-Type": contentType
        },
        body: jsonEncode(<String, String>{
          "email": email
        }),
      );
      var res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if(mounted){
          setState(() {
            isLoad = false;
            ticket = res["ticket"];
          });
        }
        Get.snackbar("Success", "Email Verified. Code sent.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
      //  Get.to(EnterPin(ticket:ticket,username: "",));
      }
      else {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Error", res["_embedded"]["errors"][0]["message"].toString(),backgroundColor: Colors.amberAccent,colorText: Colors.white);
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
      // resizeToAvoidBottomInset: false,
      bottomSheet:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 343.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get the email?".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xccacacb0),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Resend email".tr,
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
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            isLoad == false?  InkWell(
              onTap: () {
                if(mounted){
                  setState(() {
                    isLoad = true;
                  });
                }
                recoverCode(email.text.toString());
              },
              child: Container(
                width: 343.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: email.text.isEmpty
                      ? Color(0xcce9ebec)
                      : Color(0xff4a5aff),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Continue".tr,
                      style: TextStyle(
                        color: email.text.isEmpty
                            ? Color(0xccacacb0)
                            : Color(0xfffcfcfc),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ):const Center(child: CircularProgressIndicator(color: kBlueColor,),),
          ],
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBlackColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Recover my access".tr,
          style: TextStyle(
            color: Color(0xff1e1e20),
            fontSize: 14.sp,
            fontFamily: "DMSans",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: TextFormField(
                autofocus: true,
                controller: email,
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 18.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                   ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "enter email".tr,
                  hintStyle: TextStyle(
                    color: Color(0xff1e1e20),
                    fontFamily: "DMSans",
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
