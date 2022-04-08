import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/screens/signup/signup_enterusername.dart';
import 'package:simpe/services/apis.dart';
import 'package:simpe/services/keys.dart';
import '../../app/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  void initState() {
    super.initState();
    fetchDropdowns();
  }

  bool isLoading = false;
  String ticket = "";

  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController phone= TextEditingController();

   var country,currency,language;

  List items1 = [];
  List items2 = [];
  List items3 = [];

  ////////////////////////Get All Dropdowns
  Future<void> fetchDropdowns() async {
    final response = await http.get(Uri.parse('${Apis.baseUrl}${Apis.configs}'),
      headers: {
        "Content-Type": contentType
      },);
    if (response.statusCode == 200) {
      var resBody = json.decode(response.body);

      if(mounted) {
        setState(() {
          items1 = resBody["countries"];
          items2 = resBody["currencies"];
          items3 = resBody["languages"];

          country = resBody["countries"][0].toString();
          currency = resBody["currencies"][0].toString();
          language = resBody["languages"][0].toString();
         });
      }
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }


  Future<void> userRegister(String name, String email, String phone, String country, String currency,String language) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try{
      var response = await http.post(
        Uri.parse('${Apis.baseUrl}${Apis.register}'),
        headers: {
         "Content-Type": contentType
        },
        body: jsonEncode(<String, String>{
          "full_name": name,
          "email": email,
          "phone_number": phone,
          "country": country,
          "currency": currency,
          "language": language
        }),
      );
      var res = jsonDecode(response.body);

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Registration Successful.",backgroundColor: Colors.green,colorText: Colors.white);

        if(mounted){
          setState(() {
            isLoading = false;
            ticket = res["ticket"];
          });
        }

        Get.to(SignupEnterUsername(ticket:ticket));
      }
      else {
        Get.snackbar("Error", res["_embedded"]["errors"][0]["message"].toString(),backgroundColor: Colors.amberAccent,colorText: Colors.white);
        if(mounted) {
          setState(() {
            isLoading = false;
          });
        }
        throw Exception(res);
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
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:isLoading==false? InkWell(
          onTap: () {

            if (name.text.isEmpty) {
              Get.snackbar("Required", "Name is required.",backgroundColor: Colors.red,colorText: Colors.white);
            } else if (email.text.isEmpty) {
              Get.snackbar("Required", "Email is required.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text) == false) {
              Get.snackbar("Required", "Enter a valid email address.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else if (phone.text.isEmpty) {
              Get.snackbar("Required", "Phone number is required.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else if (country=="null") {
              Get.snackbar("Required", "Country is required.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else if (currency=="null") {
              Get.snackbar("Required", "Currency is required.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else if (language=="null") {
              Get.snackbar("Required", "Language is required.",backgroundColor: Colors.red,colorText: Colors.white);
            }
            else{
              if(mounted){
                setState(() {
                  isLoading = true;
                });
              }
           userRegister(name.text.toString(),email.text.toString(), phone.text.toString(),country.toString(),currency.toString(), language.toString());
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
                  "Confirm".tr,
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
        ):const Center(child:CircularProgressIndicator(color: kBlueColor,),),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverAppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme:const IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text(
            "Create account".tr,
            style: TextStyle(
              color: Color(0xff1e1e20),
              fontSize: 14.sp,
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
                  "Name".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
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
                  controller: name,
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
                  "Email".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: SvgPicture.asset(
                        "assets/icons/settings/at.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextFormField(
                        controller: email,
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
                          hintText: "dominguesmurano@gmail.com",
                          hintStyle: TextStyle(
                            color: Color(0xff1e1e20),
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
                  "Phone number".tr,
                  style: TextStyle(
                    color: Color(0xccacacb0),
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
                  controller: phone,
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
                    hintText: "+55 (11) 96365-9952",
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
                  "Country".tr,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(

                        underline: SizedBox.shrink(),
                        icon: SizedBox.shrink(),
                        hint: Text(
                          "Select Country",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        value:country,
                        items: items1.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items.toString()),
                          );
                        }).toList(),
                        onChanged: (String? changedValue) {
                          if(mounted) {
                            setState(() {
                            country =changedValue!;
                          });
                          }

                        },
                      ),
                    ),
                   const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Currency".tr,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value:currency,
                        underline:const SizedBox.shrink(),
                        icon:const SizedBox.shrink(),
                        hint: Text(
                          "Select Currency",
                          style: TextStyle(
                            color:const Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        items: items2.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items.toString()),
                          );
                        }).toList(),
                        onChanged: (String? changedValue) {
                          if(mounted) {
                            setState(() {
                              currency = changedValue!;
                            });
                          }
                        },
                      ),
                    ),
                   const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 327.w,
                child: Text(
                  "Language".tr,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        underline:const SizedBox.shrink(),
                        icon:const SizedBox.shrink(),
                        value:language,
                        hint: Text(
                          "Select Language",
                          style: TextStyle(
                            color: Color(0xff1e1e20),
                            fontSize: 14.sp,
                          ),
                        ),
                        items: items3.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items.toString()),
                          );
                        }).toList(),
                        onChanged: (String? changedValue) {
                          if(mounted) {
                            setState(() {
                              language = changedValue!;
                            });
                          }

                        },
                      ),
                    ),
                   const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

Widget getTextField(title, hint) {
  return Column(
    children: [
      SizedBox(
        width: 327.w,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xccacacb0),
            fontSize: 14,
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
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diogo Murano",
                    style: TextStyle(
                      color: Color(0xff1e1e20),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
