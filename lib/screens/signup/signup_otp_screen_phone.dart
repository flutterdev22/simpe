import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/login/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:simpe/screens/signup/signup_enter_pin.dart';

import '../../services/apis.dart';
import '../../services/keys.dart';

class SignupOtpScreenPhone extends StatefulWidget {
  String ticket;
  SignupOtpScreenPhone({Key? key,required this.ticket}) : super(key: key);

  @override
  State<SignupOtpScreenPhone> createState() => _SignupOtpScreenPhoneState();
}

class _SignupOtpScreenPhoneState extends State<SignupOtpScreenPhone> {
  LoginController controller = Get.put(LoginController());
  var uname;
  bool isLoad = false;
  bool isLoading = false;

  var user;
  Future<void> sendSmsVerification() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(mounted) {
      setState(() {
        user = prefs.getString("username");
      });
    }
    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.users}$user/telephone'),
        headers: {
          "Content-Type": contentType
        },
        body: jsonEncode(<String, String>{
          "ticket": widget.ticket,
        }),
      );
      if (response.statusCode == 204) {
        if(mounted) {
          setState(() {
            isLoading = false;
          });
        }
        Get.snackbar("Success", "Verification Sms Code Sent.",backgroundColor: Colors.green,colorText: Colors.white);
      }
      else {
        if(mounted){
          setState(() {
            isLoading = false;
          });
        }
        Get.snackbar("Warning", "Something went wrong.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
        throw Exception("Error");
      }

    } on SocketException {
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
    } on HttpException {
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
      Get.snackbar("Error", "Bad response format 👎",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    }
  }

  Future<void> verifySms(String code) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(mounted) {
      setState(() {
        uname = prefs.getString("username");
      });
    }
    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.users}$uname/telephone/validation'),
        headers: {
          "Content-Type": contentType
        },
        body: jsonEncode(<String, String>{
          "ticket": widget.ticket,
          "code": code
        }),
      );
      if (response.statusCode == 204) {
        if(mounted) {
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Success", "Verification Success.",backgroundColor: Colors.green,colorText: Colors.white);
        Get.to(SignupEnterPin(ticket:widget.ticket));

      }
      else {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Warning", "Something went wrong.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
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
      bottomSheet: Obx(
        () => Padding(
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
                      "Didn't receive the SMS?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xccacacb0),
                        fontSize: 14.sp,
                        fontFamily: "DMSans",
                      ),
                    ),
                    SizedBox(width: 16.w),
                    isLoading == true? GestureDetector(
                      onTap: (){
                        if(mounted)
                        {
                          setState(() {
                            isLoading = true;
                          });
                        }
                        sendSmsVerification();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Resend SMS",
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
                    ):
                        const Center(child: CircularProgressIndicator(color: kBlueColor,),),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              isLoad == true? InkWell(
                onTap: () {
                  if(mounted){
                    setState(() {
                      isLoad = true;
                    });
                  }
                  verifySms(controller.username.value.toString());
                //  Get.to(SignupEnterPin());
                },
                child: Container(
                  width: 343.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: controller.username.isEmpty
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
                        "Continue",
                        style: TextStyle(
                          color: controller.username.isEmpty
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
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBlackColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Enter the code sent via SMS",
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
              width: 100.h,
              child: TextFormField(
                maxLength: 4,
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  controller.username.value = v;
                },
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 18.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 10),
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "------",
                  hintStyle: TextStyle(
                    color: Color(0xff1e1e20),
                    fontFamily: "DMSans",
                    fontSize: 18.sp,
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
