import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpe/services/reuseableData.dart';
import '../../app/themes/app_colors.dart';
import '../../services/apis.dart';
import '../../services/keys.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  TextEditingController cardName = TextEditingController();
  TextEditingController cardNo = TextEditingController();
  TextEditingController validity = TextEditingController();
  TextEditingController cvv = TextEditingController();

  var uname;
  bool isLoad = false;
  Future<void> insertPaymentMethod(String type,String name,String no,String valid, String cvv) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(mounted) {
      setState(() {
        uname = prefs.getString("username");
      });
    }
    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.users}$uname/methods'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
        body: jsonEncode(<String, dynamic>{
          "type": type,
          "data": {
            "card_name": name,
            "card_number": no,
            "validity": valid,
            "cvv": cvv
          }
        }),
      );
      var res = jsonDecode(response.body);
      if (response.statusCode == 201) {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Success", "Payment Method Added!",backgroundColor: Colors.green,colorText: Colors.white);
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
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child:const Icon(Icons.chevron_left,color: Colors.black,),
          ),
          iconTheme:const IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Add card".tr,
            style: TextStyle(
              color:const Color(0xff1e1e20),
              fontSize: 24.sp,
              fontFamily: "DMSans",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Card name".tr,
                  style: TextStyle(
                    color:const Color(0xccacacb0),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
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
                  controller: cardName,
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
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Card number".tr,
                  style: TextStyle(
                    color:const Color(0xccacacb0),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 327.w,
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color:const Color(0xcce9ebec),
                    width: 1,
                  ),
                  color:const Color(0xcce9ebec),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset(
                        "assets/icons/Mastercardsmall.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: cardNo,
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
                          hintText: "4041 2947 8335 2917",
                          hintStyle: TextStyle(
                            color:const Color(0xff1e1e20),
                            fontFamily: "DMSans",
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Validity".tr,
                  style: TextStyle(
                    color:const Color(0xccacacb0),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
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
                  controller: validity,
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
                    hintText: "05/23",
                    hintStyle: TextStyle(
                      color: Color(0xff1e1e20),
                      fontFamily: "DMSans",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "CVV",
                  style: TextStyle(
                    color:const Color(0xccacacb0),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
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
                  controller: cvv,
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
                    hintText: "274",
                    hintStyle: TextStyle(
                      color: Color(0xff1e1e20),
                      fontFamily: "DMSans",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:isLoad ==false? InkWell(
                  onTap: () {
                    if (cardName.text.isEmpty) {
                      Get.snackbar("Required", "Card Name is required.",backgroundColor: Colors.red,colorText: Colors.white);
                    } else if (cardNo.text.isEmpty) {
                      Get.snackbar("Required", "Card Number is required.",backgroundColor: Colors.red,colorText: Colors.white);
                    }
                    else if (cardNo.text.length !=19) {
                      Get.snackbar("Required", "Card Number is not valid.",backgroundColor: Colors.red,colorText: Colors.white);
                    }
                    else if (validity.text.isEmpty) {
                      Get.snackbar("Required", "Validity is required.",backgroundColor: Colors.red,colorText: Colors.white);
                    }
                    else if (cvv.text.isEmpty) {
                      Get.snackbar("Required", "CVV is required.",backgroundColor: Colors.red,colorText: Colors.white);
                    }
                    else{
                      if(mounted){
                        setState(() {
                          isLoad = true;
                        });
                      }
                      insertPaymentMethod("CREDIT_CARD",cardName.text.toString(),
                      cardNo.text.toString(), validity.text.toString(), cvv.text.toString());
                    }

                  },
                  child: Container(
                    width: double.infinity,
                    color:const Color(0xa3fcfcfc),
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:const Color(0xff4a5aff),
                      ),
                      child: Center(
                        child: Text(
                          "Confirm".tr,
                          style: TextStyle(
                            color:const Color(0xfffcfcfc),
                            fontSize: 14.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ): const Center(child: CircularProgressIndicator(color: kBlueColor,),)
              ),
            ],
          ),
        )
      ]),
    );
  }
}
