import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:locksee/controller/home_screen_controller.dart';

import '../utils/AppColors.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  var homeController = Get.put(HomeController());

  bool isDarkMode = false;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: homeController.pages[homeController.pageIndex.value]),
          ],
        ),

          bottomNavigationBar: Container(



      decoration: BoxDecoration(),
      child: ConvexAppBar(

      backgroundColor: Colors.white,
      cornerRadius: 5,
      color: Colors.black,
      activeColor:AppColor.appColor,
      style: TabStyle.fixedCircle,


      shadowColor: Colors.grey.shade400,

      //  currentIndex: homeController.pageIndex.value,
        //       onTap: (int index) {
        //         homeController.pageIndex.value = index;
        //
        initialActiveIndex: homeController.pageIndex.value,
        onTap: (int i) {



          if (i == 2) {
            // Do nothing when the lock icon is tapped
            return;
          }
          setState(() {
            homeController.pageIndex.value = i;
          });




        },
      items: [

        TabItem(

      title: 'chats'.tr,

          icon: Container(
            padding: EdgeInsets.only(top: 3),

            child:


            SvgPicture.asset(
                            'assets/images/nav_bar_icons/comm_chat.svg',
                            width: height * .6,
                            height: height * .6,
              color:   homeController.pageIndex.value == 0 ? AppColor.appColor : Colors.black,

            ),
          ),
        ),


        TabItem(
          title: 'calls'.tr,

          icon: Container(
            // padding: EdgeInsets.all(5),

            padding: EdgeInsets.only(top: 3),

            child:


            SvgPicture.asset(
              'assets/images/nav_bar_icons/call_active_icon.svg',
              width: height * .6,
              height: height * .6,
              color:   homeController.pageIndex.value == 1 ? AppColor.appColor : Colors.black,

            ),
          ),
        ),





        TabItem(
      icon: Container(


      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
      color: AppColor.appColor,

      shape: BoxShape.circle,
      ),
      child:
     
      // SvgPicture.asset('assets/images/lock_image.png'), 
        
        Image.asset("assets/images/lock_image.png")

      ),

      ),





        TabItem(
          title: 'connect'.tr,

          icon: Container(
            // padding: EdgeInsets.all(5),
            padding: EdgeInsets.only(top: 3),

            child:


            SvgPicture.asset(
              'assets/images/nav_bar_icons/connect_icon.svg',
              width: height * .6,
              height: height * .6,
              color:   homeController.pageIndex.value == 3 ? AppColor.appColor : Colors.black,

            ),
          ),
        ),
        TabItem(
          title: 'account'.tr,

          icon: Container(
            // padding: EdgeInsets.all(5),
            padding: EdgeInsets.only(top: 3),

            child:


            SvgPicture.asset(
              'assets/images/nav_bar_icons/user.svg',
              width: height * .6,
              height: height * .6,
              color:   homeController.pageIndex.value == 4 ? AppColor.appColor: Colors.black,

            ),
          ),
        ),


      ],



      ),
      )




      );
    });
  }
}

