import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/login/enter_pin.dart';
import 'package:simpe/screens/login/login_controller.dart';
import 'package:http/http.dart'as http;
import '../../services/apis.dart';
import '../../services/keys.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  String ticket = "";
  bool isLoad = false;

  Future<void> loginWithUsername(String username) async{

    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.login}'),
        headers: {
          "Content-Type": contentType
        },
        body: jsonEncode(<String, String>{
          "username": username
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
        Get.snackbar("Success", "Username Verified.",backgroundColor: Colors.green,colorText: Colors.white);
        Get.to(EnterPin(ticket:ticket,username:username));
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
      bottomSheet: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:isLoad == false? InkWell(
            onTap: () {
              if(mounted){
                setState(() {
                  isLoad = true;
                });
              }
              loginWithUsername(controller.username.value.toString());

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
                    "Continue".tr,
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
          ):const Center(child:CircularProgressIndicator(color: kBlueColor,),),
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBlackColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Enter your username".tr,
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
              width: 16,
              height: 16,
              child: SvgPicture.asset("assets/icons/at_black.svg"),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 100.h,
              child: TextFormField(
                autofocus: true,
                onChanged: (v) {
                  controller.username.value = v;
                },
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
                  hintText: "username".tr,
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
