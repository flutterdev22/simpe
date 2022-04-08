import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/services/reuseableData.dart';

import '../../app/themes/app_colors.dart';
import 'package:http/http.dart' as http;

import '../../services/apis.dart';
import '../../services/keys.dart';

class WithDrawBalance extends StatefulWidget {
  const WithDrawBalance({Key? key}) : super(key: key);

  @override
  State<WithDrawBalance> createState() => _WithDrawBalanceState();
}

class _WithDrawBalanceState extends State<WithDrawBalance> {
  bool isLoading = false;

  Future<void> withdraw(String value) async{

    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}v1/withdraw'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
        body: jsonEncode(<String, String>{
          "key_type": reuseableData.email,
          "pix_key": reuseableData.email,
          "value": value,
          "currency": reuseableData.currency,
        }),
      );

      if (response.statusCode == 204) {
        Get.snackbar("Success", "Withdraw Successful.",backgroundColor: Colors.green,colorText: Colors.white);

        if(mounted){
          setState(() {
            isLoading = false;
          });
        }
      }
      else {
        Get.snackbar("Error", "Something went wrong.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
        if(mounted) {
          setState(() {
            isLoading = false;
          });
        }
        throw Exception("Error");
      }

    } on SocketException {
      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
      if(mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } on HttpException {
      if(mounted) {
        setState(() {
          isLoading = false;
        });
      }
      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {
      if(mounted) {
        setState(() {
          isLoading = false;
        });
      }
      Get.snackbar("Error", "Bad response format 👎",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    }
  }


  TextEditingController value = TextEditingController();
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
    return Container(
      color: Colors.transparent,
      height: 600.h,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Container(
                  height: 4.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: Color(0xffACACB0).withAlpha(25),
                  )),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Withdraw balance".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 18.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                width: 327.w,
                height: 190.h,
                child: Image.asset("assets/imges/withdrawa.png"),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Choose how you want to withdraw money from your Simpe account".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: ListTile(
                  title: Text(
                    "Withdrawal to bank account".tr,
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
                  subtitle: SizedBox(
                    width: 199.h,
                    child: Text(
                      "Available at your bank".tr,
                      style: TextStyle(
                        color: Color(0xff1e1e20),
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  leading: Image.asset(
                    "assets/icons/traansfermoneyicon.png",
                    width: 42.w,
                    height: 42.h,
                  ),
                ),
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
                  controller: value,
                  keyboardType: TextInputType.number,
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
                height: 20.h,
              ),
              isLoading == false ?Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {
                   if(value.text.isEmpty){
                     Get.snackbar("Warning", "Add some value to withdraw",colorText: Colors.white,backgroundColor: Colors.red);
                   }
                   else{
                     if(mounted){
                       setState(() {
                         isLoading = true;
                       });
                     }
                     withdraw(value.text.toString());
                   }
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
                          "Continue".tr,
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
              ):
             const Center(child: CircularProgressIndicator(color: kBlueColor,),),
            ],
          ),
        ),
      ),
    );
  }
}
