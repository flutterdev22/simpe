import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpe/services/apis.dart';
import 'package:simpe/services/keys.dart';
import 'package:simpe/services/reuseableData.dart';
import '../../app/themes/app_colors.dart';
import '../../models/payment_card_list.dart';
import 'addpayment_methods.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPaymentCards();
  }

  bool isLoad = true;
  bool showOther = false;
  var username;
  List data = [];
  ////////////////////////Get All Payment Cards
  Future<void> fetchPaymentCards() async {


    try {
      final response = await http.get(
          Uri.parse(
              '${Apis.baseUrl}${Apis.users}${reuseableData.username}/methods'),
          headers: {
            'Content-Type': contentType,
            'Authorization': "Bearer ${reuseableData.token}"
          });
      var res = json.decode(response.body);
      log(res.toString());
      if (response.statusCode == 200 && res.toString() !="{}") {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["data"];
        if(mounted){
          setState(() {
            isLoad = false;
            showOther = false;
          });
        }

      }
      else if(response.statusCode == 200 && res.toString() =="{}"){
        if(mounted){
          setState(() {
            isLoad = false;
            showOther = true;
          });
        }
      }
      else {
        Get.snackbar("Error", res["_embedded"]["errors"][0]["message"].toString(),backgroundColor: Colors.amberAccent,colorText: Colors.white);
        if(mounted){
          setState(() {
            isLoad = false;
            showOther = true;
          });
        }
        throw Exception('Unexpected error occurred!');
      }
    } on SocketException {
      if(mounted){
        setState(() {
          isLoad = false;
          showOther = true;
        });
      }
      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
    } on HttpException {
      if(mounted){
        setState(() {
          isLoad = false;
          showOther = true;
        });
      }
      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {
      if(mounted){
        setState(() {
          isLoad = false;
          showOther = true;
        });
      }
      Get.snackbar("Error", "Bad response format 👎",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    }
  }

  var uname;
  Future<void> deletePaymentMethod(String id) async{

    try{
      var response = await http.delete(
        Uri.parse('${Apis.baseUrl}${Apis.users}${reuseableData.username}/methods/$id'),
        headers: {
          "Content-Type": contentType,
          'Authorization': "Bearer ${reuseableData.token}"
        },);
      if (response.statusCode == 204) {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        fetchPaymentCards();
        Get.snackbar("Success", "Payment Method Deleted!",backgroundColor: Colors.green,colorText: Colors.white);
      }
      else {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.snackbar("Error", "Something went wrong.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
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
          automaticallyImplyLeading: false,
          iconTheme:const IconThemeData(
            color: kBlackColor,
          ),
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Payment methods".tr,
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
              Text(
                "Manage existing methods in your account".tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
                  showOther ==false? isLoad == false? ListView.builder(
                      physics:
                      const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext
                      context,
                          int index) =>
                          Container(
                            width: 327.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:const Color(0xfffcfcfc),
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
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Image.asset(data[index]["brand_name"].toString() =="MASTERCARD"? "assets/icons/Mastercard.png":
                                          data[index]["brand_name"].toString() =="VISA"? "assets/icons/visa.png":"assets/icons/Mastercard.png")),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]["type"].toString(),
                                        style: TextStyle(
                                          color:const Color(0xff1e1e20),
                                          fontSize: 14.sp,
                                          fontFamily: "DM Sans",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "Final ${data[index]["end_numbers"].toString()}",
                                        style: TextStyle(
                                          color:const Color(0xcc1e1e20),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset("assets/icons/edit.svg"),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: (){
                                    if(mounted){
                                      setState(() {
                                        isLoad = true;
                                      });
                                    }
                                    deletePaymentMethod(data[index]["id"].toString());
                                  },
                                  child: Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child:
                                    SvgPicture.asset("assets/icons/Base-trash.svg"),
                                  ),
                                ),
                              ],
                            ),
                          )):
                  const Center(child: CircularProgressIndicator(color: kBlueColor,),):
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Text("No Payment Methods Found.",style: TextStyle(fontSize: 20.sp,color: kBlueColor))),
            ),
              SizedBox(height: 16.h),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPaymentMethod()),
                    ).then((value) {
                      if(mounted) {
                        setState(() {
                        fetchPaymentCards();
                      });
                      }
                    });
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
                          "+ Add",
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
            ],
          ),
        )
      ]),
    );
  }

}
