import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simpe/app/routs/app_routes.dart';
import 'package:simpe/models/transaction_list.dart';
import 'package:simpe/screens/Home/addbalance.dart';
import 'package:simpe/screens/Home/withdrawbalance.dart';
import 'package:simpe/services/reuseableData.dart';
import '../../app/themes/app_colors.dart';
import 'package:get/route_manager.dart';

import '../../app/widgets/progress_dialog.dart';
import '../../services/apis.dart';
import '../../services/keys.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoad = true;
  bool showOther = false;
  Future<List<TransactionData>>? transactions;
  var dateString;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    dateString = format.format(DateTime.now());
  }

  var format = DateFormat.yMMMMd('en_US');


  var username;
  ////GET USER DATA
  Future<void> getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(mounted) {
      setState(() {
        username = prefs.getString("username");
      });
    }
    try{
      var response = await http.get(
          Uri.parse('${Apis.baseUrl}${Apis.users}$username'),
          headers: {
            "Content-Type": contentType,
            "Authorization": "Bearer ${reuseableData.token}"
          });
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if(mounted){
          setState(() {
            isLoad = false;
            reuseableData.username =res["username"];
            reuseableData.email =res["email"];
            reuseableData.phone =res["phone_number"];
            reuseableData.balance =res["balance"];
            reuseableData.country =res["configurations"]["country"];
            reuseableData.currency =res["configurations"]["currency"];
            reuseableData.language =res["configurations"]["language"];
            reuseableData.showInSearches =res["configurations"]["show_in_searches"];
            reuseableData.receiveViaLink =res["configurations"]["receive_via_link"];
          });
        }
        tokenVerify();
        transactions = getTransactionsList();
      //  getQrCode();
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
  //Validate Pin
    Future<void> tokenVerify() async{
    try{

      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.validate}'),
        headers: {
          "Content-Type": contentType,
        },
        body: jsonEncode(<String, String>{
          "access_token": reuseableData.token,
          "username": reuseableData.username
        }),
      );

      if (response.statusCode == 204) {

        Get.snackbar("Success", "Token valid",backgroundColor: Colors.greenAccent,colorText: Colors.white);
      }
      else if(response.statusCode == 422){
        Get.snackbar("Error", "Token Invalid",backgroundColor: Colors.amberAccent,colorText: Colors.white);
      }
      else {

        Get.snackbar("Error", "Something went wrong",backgroundColor: Colors.amberAccent,colorText: Colors.white);
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
  ////GET QR CODE
  Future<void> getQrCode() async{

    try{
      var response = await http.get(
          Uri.parse('${Apis.baseUrl}${Apis.users}${reuseableData.username}/qrcode'),
          headers: {
            "Content-Type": contentType,
            "Authorization": "Bearer ${reuseableData.token}"
          });
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if(mounted){
          setState(() {
            isLoad = false;
            reuseableData.qrcode =res["qrcode"];
          });
        }
      //  transactions = getTransactionsList();

      }
      else {
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
  ///GET TRANSACTIONS
  Future<List<TransactionData>> getTransactionsList() async{

    try{
      var response = await http.get(
          Uri.parse('${Apis.baseUrl}${Apis.users}${reuseableData.username}/transactions'),
          headers: {
            "Content-Type": contentType,
            "Authorization": "Bearer ${reuseableData.token}"
          });
      var res = jsonDecode(response.body);
      log(res.toString());
      if (response.statusCode == 200 && res.toString() !="{}") {
        List<dynamic> data = json.decode(response.body);
        if(mounted){
          setState(() {
            isLoad = false;
            showOther = false;
          });
        }
        return data.map((data) => TransactionData.fromJson(data)).toList();
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
        if(mounted){
          setState(() {
            isLoad = false;
            showOther = true;
          });
        }
        Get.snackbar("Error", res["_embedded"]["errors"][0]["message"].toString(),backgroundColor: Colors.amberAccent,colorText: Colors.white);
        throw Exception("Error");
      }

    } on SocketException {
      if(mounted){
        setState(() {
          showOther = true;
          isLoad = false;
        });
      }
      Get.snackbar("Error", "No Internet Connection.",backgroundColor: Colors.red,colorText: Colors.white);
    } on HttpException {
      if(mounted){
        setState(() {
          showOther = true;
          isLoad = false;
        });
      }
      Get.snackbar("Error", "Couldn't find the data 😱.",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    } on FormatException {
      if(mounted){
        setState(() {
          showOther = true;
          isLoad = false;
        });
      }
      Get.snackbar("Error", "Bad response format 👎",backgroundColor: Colors.amberAccent,colorText: Colors.white);
    }
    return throw Exception("Error");
  }


  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );

    return Scaffold(
      body: ProgressHUD(
        child: CustomScrollView(
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
                                      "assets/icons/Vector.png", "transfer".tr),
                                ),
                                InkWell(
                                  onTap: () {
                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder: (context) => AddBalance(),
                                    );
                                  },
                                  child: getIconHeader(
                                      "assets/icons/Vector (1).png", "add".tr),
                                ),
                                InkWell(
                                  onTap: () {
                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder: (context) => WithDrawBalance(),
                                    );
                                  },
                                  child: getIconHeader(
                                      "assets/icons/Vector (2).png", "withdraw".tr),
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
                      'Latest Transactions'.tr,
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: Text(
                        dateString.toString(),
                        textAlign: TextAlign.center,
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
                    ),
                    isLoad
                        ? Shimmer.fromColors(
                      baseColor: (Colors.grey[300])!,
                      highlightColor: (Colors.grey[100])!,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return dummyListView();
                          }),
                    )
                        :showOther==true?Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(child: Text("No Transactions Found".tr,style: TextStyle(fontSize: 25.sp,color: kBlueColor))),
                        ):
                    FutureBuilder<List<TransactionData>>(
                      future: transactions,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<TransactionData>? data = snapshot.data;

                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: data!.length,
                              itemBuilder: (BuildContext
                              context,
                                  int index) =>
                                  buildGridCard(items: data[index],));
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Something went wrong".tr,style: TextStyle(fontSize: 20.sp,color: kBlueColor),));
                        }
                        return const Center();
                      },
                    )

                  ],
                ),
              ),
            )
          ],
        ),
        inAsyncCall: isLoad,
        opacity: 0.3,
      ),
    );
  }

  Widget dummyListView() {
    return ListTile(
      onTap: () {},
      leading: SizedBox(
          width: 40.h,
          height: 40.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset("assets/icons/appicon.png", fit: BoxFit.cover,))),
      title: // Figma Flutter Generator TitleWidget - TEXT
      Container(
        width: 20,
        height: 20,
        color: Colors.grey,
      ),
      subtitle: // Figma Flutter Generator SubtextWidget - TEXT
      Container(
        width: 20,
        height: 20,
        color: Colors.grey,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
          Container(
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
          Container(
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget buildGridCard({
    required TransactionData items,
  }) {
    return customListtille(
        img: "assets/icons/appicon.png",
        text: items.user.username,
        subtext: items.user.fullName,
        amount: items.value,);

  }

  ListTile customListtille({img, text, subtext,  amount}) {
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
          'Balance'.tr,
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
                reuseableData.balance,
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
