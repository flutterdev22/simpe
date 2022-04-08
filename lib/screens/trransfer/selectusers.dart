import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simpe/app/themes/app_colors.dart';
import 'package:simpe/models/search_user.dart';
import 'package:simpe/screens/trransfer/transferprofille.dart';
import 'package:http/http.dart' as http;
import 'package:simpe/services/reuseableData.dart';
import '../../services/apis.dart';
import '../../services/keys.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {

  bool isLoad = false;
  bool showOther = false;
  TextEditingController search = TextEditingController();

  Future<List<SearchUser>>? users;

  Future<List<SearchUser>> getUserByUsername() async{
    try{
      var response = await http.get(Uri.parse('${Apis.baseUrl}${Apis.users}/?s=${search.text.toString()}'),
        headers: {
          "Content-Type": contentType,
          "Authorization": "Bearer ${reuseableData.token}"
        },
      );
      var res = jsonDecode(response.body);
      if (response.statusCode == 200 && res.toString() !="[]") {
        List<dynamic> data = json.decode(response.body);

        if(mounted){
          setState(() {
            isLoad = false;
            showOther = false;
          });
        }

        return data.map((data) => SearchUser.fromJson(data)).toList();
      }
      else if(response.statusCode == 200 && res.toString() =="[]"){
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
      //  Get.snackbar("Error", res["_embedded"]["errors"][0]["message"].toString(),backgroundColor: Colors.amberAccent,colorText: Colors.white);
        throw Exception("Error");
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
    return throw Exception("Error");
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
          iconTheme:const IconThemeData(
            color: kBlackColor, //change your color here
          ),
          pinned: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Transfer/username".tr,
            style: TextStyle(
              color: const Color(0xff1e1e20),
              fontSize: 24.sp,
              fontFamily: "DMSans",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(children: [
              SizedBox(
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
                          controller: search,
                          onChanged: (value) {
                            if(mounted){
                              setState(() {
                                isLoad = true;
                              });
                            }
                            users = getUserByUsername();
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
                              prefixIcon: SizedBox(
                                  width: 16.w,
                                  height: 16.h,
                                  child: SvgPicture.asset(
                                    "assets/icons/search.svg",
                                    fit: BoxFit.scaleDown,
                                  )),
                              hintStyle: TextStyle(
                                color: const Color(0xccacacb0),
                                fontSize: 14.sp,
                                fontFamily: "DMSans",
                                fontWeight: FontWeight.w500,
                              ),
                              hintText: "search username".tr),
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Recent".tr,
                  style: TextStyle(
                    color: const Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),

                isLoad == false? showOther==true?Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text("No Users Found".tr,style: TextStyle(fontSize: 25.sp,color: kBlueColor))),
                ):
                FutureBuilder<List<SearchUser>>(
                  future: users,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<SearchUser>? data = snapshot.data;

                      return ListView.builder(
                          physics:
                          const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: data!.length,
                          itemBuilder: (BuildContext
                          context,
                              int index) =>
                              GestureDetector(
                                  onTap: (){
                                    Get.to(TransferProfile(username:data[index].username));
                                  },
                                  child: buildGridCard(items: data[index],)));
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Something went wrong",style: TextStyle(fontSize: 20.sp,color: kBlueColor),));
                    }
                    return const Center();
                  },
                ):
                Center(child: CircularProgressIndicator(color: kBlueColor,),),
              ],
            ),
          ),
        ),
      ]),
    );
  }
  Widget buildGridCard({
    required SearchUser items,
  }) {
    return searchItemTille("assets/icons/appicon.png",items.username,items.username);
  }
  Container searchItemTille(img, text, subtext) {
    return Container(
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0x3dacacb0),
                width: 0.50,
              ),
              color: const Color(0xff1e1e20),
            ),
            width: 39.w,
            height: 39.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xff1e1e20),
                    fontSize: 14.sp,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtext,
                  style: TextStyle(
                    color: const Color(0xccacacb0),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
