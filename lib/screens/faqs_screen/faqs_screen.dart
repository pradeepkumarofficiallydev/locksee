import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/screens/account_statement/points_tab.dart';
import 'package:locksee/screens/account_statement/survey_history_tab.dart';
import 'package:locksee/screens/faqs_screen/redemption_tab.dart';
import 'package:locksee/screens/faqs_screen/rewards_tab.dart';
import 'package:locksee/screens/faqs_screen/survey_tab.dart';
import 'package:locksee/utils/AppColors.dart';
import '../../utils/app_text_styles.dart';
import 'membership_tab.dart';
import 'miscellaneous_tab.dart';

class FaqsScreen extends StatefulWidget {
  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<FaqsScreen>
    with SingleTickerProviderStateMixin {
    late TabController _tabController;





  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when done
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,



        appBar: AppBar(





        leading: Padding(
            padding:  EdgeInsets.only(left:  height*.5, top: height*.2),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon:  Icon(Icons.arrow_back, color: Colors.black,size:  height*.5,),
                onPressed: () {


                  Get.back();




                },
              ),
            ),
        ),


          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text(
            'FAQs',

            style:
            AppTextStyles.normalopenSans1(AppColor.whiteColor, height * .5),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            // Adjust the preferred size
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              // Remove default padding (left and right)
              child: TabBar(
                controller: _tabController,
                // Assign the controller here
                indicatorColor: Colors.pink,
                indicatorWeight: 3.0,
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                // add this line

                indicatorSize: TabBarIndicatorSize.label,

                padding: EdgeInsets.zero,

                // indicatorPadding: EdgeInsets.zero,
                //  labelPadding: EdgeInsets.zero,

                // Allow scrolling if tabs overflow
                labelStyle: AppTextStyles.normalopenSans1(
                    AppColor.whiteColor, height * .34),

                unselectedLabelStyle: AppTextStyles.normalopenSans1(
                    AppColor.whiteColor, height * .3),

                tabs: [
                  Tab(text: "Rewards",
                  ),
                  Tab(text: "Membership"),
                  // //
                  Tab(text: "Survey"),


                  Tab(text: "Redemption"),
                  Tab(text: "Miscellaneous")
                  ,







                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [



            RewardsTab(),

            MembershipTab(),


            SurveyTab(),

            RedemptionTab(),


            MiscellaneousTab(),


            //
            // HouseHoldTab(),





          ],
        ),
      ),
    );
  }
}

