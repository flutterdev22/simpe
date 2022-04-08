import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/screens/trransfer/success.dart';
import 'package:http/http.dart' as http;
import 'package:simpe/services/reuseableData.dart';
import '../../services/apis.dart';
import '../../services/keys.dart';

class TransferProfile extends StatefulWidget {
  String username;
   TransferProfile({Key? key,required this.username}) : super(key: key);

  @override
  State<TransferProfile> createState() => _TransferProfileState();
}

class _TransferProfileState extends State<TransferProfile> {
  bool  oneSelect = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPaymentCards();
   // getConversion("$", "R$");
  }


  bool isLoad = false;
  TextEditingController value = TextEditingController();
  TextEditingController real = TextEditingController();

  Future<void> sendTransaction(String value,String currency,String method,String id) async{

    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.transactions}'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
        body: jsonEncode(<dynamic, dynamic>{
          "from": {
            "value": value,
            "currency": currency,
            "method": method,
            "method_id": id
          },
          "target": {
            "user": widget.username
          }
        }),
      );
      if (response.statusCode == 204) {
        if(mounted){
          setState(() {
            isLoad = false;
          });
        }
        Get.to(const SuccessTransfer());
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

  bool showOther = false;
  var username;
  List data = [];
  int selectedIndex=0;
  var method, methodId,currency;
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

  ////////////////////////Get All Conversion
  Future<void> getConversion(String s1, String s2) async {


    try {
      final response = await http.get(
          Uri.parse(
              '${Apis.baseUrl}v1/consult?from=$s1&target=$s2'),
          headers: {
            'Content-Type': contentType,
            'Authorization': "Bearer ${reuseableData.token}"
          });
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
       List<dynamic> data =json.decode(response.body);
       log(data.toString());
        if(mounted){
          setState(() {
            isLoad = false;
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
        child: isLoad == false?InkWell(
          onTap: () {
            if(mounted){
              setState(() {
                isLoad = true;
              });
            }
            sendTransaction(value.text.toString(),currency,method,methodId);
          },
          child: Container(
            width: double.infinity,
            color: const Color(0xa3fcfcfc),
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff4a5aff),
              ),
              child: Center(
                child: Text(
                  "Transfer".tr,
                  style: TextStyle(
                    color: const Color(0xfffcfcfc),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ):const Center(child: CircularProgressIndicator(color: kBlueColor,),)
      ),
      body: CustomScrollView(slivers: [

        SliverAppBar(
          collapsedHeight: 100.h,
          elevation: 0,
          iconTheme: const IconThemeData(
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
                  "Transferring to".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff1e1e20),
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
                      "assets/icons/Simpe.png",
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                height: 16.h,
              ),
              Text(
                widget.username,
                style: TextStyle(
                  color: const Color(0xff1e1e20),
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
                            "Transfer value".tr,
                            style: TextStyle(
                              color: const Color(0xff1e1e20),
                              fontSize: 16.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        getTextField(value),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "Will be converted to".tr,
                            style: TextStyle(
                              color: const Color(0xff1e1e20),
                              fontSize: 16.sp,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        getTextField2(real),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Text(
                            "1 real = 0.19 dollars.",
                            style: TextStyle(
                              color: const Color(0xccacacb0),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fee of 1.32 real",
                                style: TextStyle(
                                  color: const Color(0xff1e1e20),
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "Effective instantly".tr,
                                style: TextStyle(
                                  color: const Color(0xff1e1e20),
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                "Julia will receive R\$ 219,43",
                                style: TextStyle(
                                  color: const Color(0xff1e1e20),
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
                            "Choose payment method".tr,
                            style: TextStyle(
                              color: const Color(0xccacacb0),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListTile(
                          tileColor: oneSelect == true?kBlueColor.withOpacity(0.3):Colors.white,
                          onTap: () {
                            if(mounted){
                              setState(() {
                                oneSelect = true;
                                method = "BALANCE";
                                methodId = " ";
                                currency = reuseableData.currency;
                              });
                            }

                          },
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
                          subtitle: Text(
                           reuseableData.balance,
                            style: TextStyle(
                              color: Color(0xcc1e1e20),
                              fontSize: 10.sp,
                            ),
                          ),
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
                                GestureDetector(
                                  onTap: (){
                                    if(mounted){
                                      setState(() {
                                        oneSelect = false;
                                        selectedIndex = index;
                                        method = "CARD";
                                        methodId = data[index]["id"];
                                        currency = reuseableData.currency;
                                      });
                                    }
                                  },
                                  child: Container(
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
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.grey),
                                            color: selectedIndex == index ? kBlueColor : const Color(0xfffcfcfc),
                                          ),

                                          width: 24.w,height: 24.h,
                                          child: Center(child: Icon(Icons.check,color: Colors.white,size: 12.sp,)),
                                        )


                                      ],
                                    ),
                                  ),
                                )):
                        const Center(child: CircularProgressIndicator(color: kBlueColor,),):
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(child: Text("No Payment Methods Found.",style: TextStyle(fontSize: 20.sp,color: kBlueColor))),
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

  Widget getTextField(TextEditingController controller) {
    return SizedBox(
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
                color: const Color(0x3dacacb0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              child: TextFormField(
                  controller:controller,
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
                          "Dollars".tr,
                          style: TextStyle(
                            color: const Color(0xff1e1e20),
                            fontSize: 16.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color:  Color(0xccacacb0),
                        )
                      ],
                    ),
                    hintStyle: TextStyle(
                      color: const Color(0xccacacb0),
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

  Widget getTextField2(TextEditingController controller) {
    return SizedBox(
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
                color: const Color(0x3dacacb0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              child: TextFormField(
                  controller:controller,
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
                          "Real".tr,
                          style: TextStyle(
                            color: const Color(0xff1e1e20),
                            fontSize: 16.sp,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color:  Color(0xccacacb0),
                        )
                      ],
                    ),
                    hintStyle: TextStyle(
                      color: const Color(0xccacacb0),
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
                color: const Color(0xff423fff),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg,
                    style: TextStyle(
                      color: const Color(0xff1e1e20),
                      fontSize: 14.sp,
                      fontFamily: "DMSans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
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
