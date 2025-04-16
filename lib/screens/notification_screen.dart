import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/controller/notification_controller.dart';
import 'package:locksee/utils/AppColors.dart';

import '../utils/custom_widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      // appBar: AppBar(
      //
      //
      //
      //
      //
      // //  backgroundColor: Colors.white,
      //
      //
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu, color: Colors.black),
      //     onPressed: () {
      //
      //
      //
      //     },
      //   ),
      //
      //
      //
      //   title: const Text(
      //     "Notifications",
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //
      //
      //
      //   actions: [
      //     TextButton(
      //       onPressed: () {},
      //       child: const Text(
      //         "Clear all",
      //         style: TextStyle(color: Colors.pinkAccent),
      //       ),
      //     ),
      //   ],
      // ),


      body: Container(


        color: AppColor.whiteColor,

        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.white, Colors.pinkAccent],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),





        child: Column(
          children: [
            Container(
              height: 90,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.pinkAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded,
                        color: Colors.black),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Clear all",
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ],
              ),
            ),

            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Colors.pink, Colors.purple],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ),
            // borderRadius: BorderRadius.vertical(
            //   bottom: Radius.circular(30),
            // ),
            // ),

            // GetBuilder<NotificationController>(
            //   init: NotificationController(),
            //   builder: (s) => Expanded(
            //     child: SingleChildScrollView(
            //
            //       child: ListView.builder(
            //

            //
            //
            //         physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: s.notififcationResponse.value.data?.length ?? 0,
            //
            //
            //         itemBuilder: (context, index) {
            //
            //           var notificationItem= s.notififcationResponse.value.data![index];
            //           //var  checkName=notificationItem.p
            //
            //
            //
            //
            //
            //
            //
            //           return
            //
            //               //   ListTile(
            //               // title: Text(data[index]['title']),
            //               // subtitle: Text(data[index]['body']),
            //               // onTap: () {
            //               // print('Tapped on ${data[index]['title']}');
            //               // },
            //               // );
            //
            //               _buildNotificationItem(
            //             context,
            //             icon:"",
            //
            //
            //
            //             // checkName == 'sign_up_bonus'
            //             //     ? GlobalImages.nBonus
            //             //     : checkName == 'profile_survey_completed'
            //             //     ? GlobalImages.nCongratulations
            //             //     : checkName == 'profile_survey_not_completed'
            //             //     ? GlobalImages.nSurvey
            //             //     : checkName == 'poll_reward'
            //             //     ? GlobalImages.nPollPoint
            //             //     : checkName == 'referral_bonus'
            //             //     ? GlobalImages.nReferralReward
            //             //     : checkName == 'coupon_reward'
            //             //     ? GlobalImages.nCouponReward
            //             //     : checkName == 'profile_not_updated'
            //             //     ? GlobalImages.nMissedYou
            //             //     : checkName == 'referred_user_created_account'
            //             //     ? GlobalImages.nCongratulations
            //             //     : checkName == 'referred_user_approved'
            //             //     ? GlobalImages.nAccountApproved
            //             //     : checkName == 'referred_user_rejected'
            //             //     ? GlobalImages.nAccountRejected
            //             //     : checkName == 'new_poll_available'
            //             //     ? GlobalImages.nSurvey
            //             //     : checkName == 'refer_more_user'
            //             //     ? GlobalImages.nOfferEnds
            //             //     : checkName == 'survey_reward'
            //             //     ? GlobalImages.nReferralReward
            //             //     : checkName == 'coupn_rejected'
            //             //     ? GlobalImages.nCouponRrejected
            //             //     : checkName == 'new_survey_available'
            //             //     ? GlobalImages.nSurvey
            //             //     : checkName == 'b2b_survey_incomplete'
            //             //     ? GlobalImages.b2bsurvey
            //             //     : null
            //
            //             //
            //             //
            //             //
            //             //
            //             //
            //             //
            //             // notificationItem.,
            //             iconColor: Colors.orange,
            //             title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //             subtitle: "Unlock now.",
            //             time: "2h",
            //
            //
            //
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            //


            GetBuilder<NotificationController>(
              init: NotificationController(),
              builder: (s) =>
                  Expanded(
                    child: SingleChildScrollView(

                      child:
                      s.isLoading.value
                          ? CustomWidgets.showCircularIndicator1(
                          context, height * .9, AppColor.appColor):


                      ListView.builder(


                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: s.masternotificationlistResponse.value.data
                            ?.notifications?.length ?? 0,


                        itemBuilder: (context, index) {
                          var notificationItem = s
                              .masternotificationlistResponse.value.data
                              ?.notifications![index];
                          var checkName = notificationItem?.partKey;

                          print(checkName);


                          return

                            _buildNotificationItem(
                              context,
                              icon:

                                    checkName == 'sign_up_bonus'
                                  ? "assets/images/nBonus.png"
                                  : checkName == 'profile_survey_completed'
                                  ? "assets/images/notification_congratulations.png"
                                  : checkName == 'profile_survey_not_completed'
                                  ? "assets/images/notification_survey.png"
                                  : checkName == 'poll_reward'
                                  ? "assets/images/notification_poll_point.png"
                                  : checkName == 'referral_bonus'
                                  ? "assets/images/notification_referral_reward.png"
                                  : checkName == 'coupon_reward'
                                  ? "assets/images/notification_coupon_reward.png"
                                  : checkName == 'profile_not_updated'
                                  ? "assets/images/notification_missed_you.png"
                                  : checkName == 'referred_user_created_account'
                                  ? "assets/images/notification_congratulations.png"
                                  : checkName == 'referred_user_approved'
                                  ? "assets/images/nAccountApproved.png"
                                  : checkName == 'referred_user_rejected'
                                  ? "assets/images/nAccountRejected.png"
                                  : checkName == 'new_poll_available'
                                  ? "assets/images/notification_survey.png"
                                  : checkName == 'refer_more_user'
                                  ? "assets/images/notification_offer_ends.png"
                                  : checkName == 'survey_reward'
                                  ? "assets/images/notification_referral_reward.png"
                                  : checkName == 'coupn_rejected'
                                  ? "assets/images/notification_coupon_rejected.png"
                                  : checkName == 'new_survey_available'
                                  ? "assets/images/notification_survey.png" : checkName == 'b2b_survey_incomplete'
                                  ? "assets/images/b2bsurvey.jpg"
                                   : checkName == 'not data found'

                                  "" ? "" : ""


                              ,

                              iconColor: Colors.orange,

                              title: notificationItem?.partContent ?? '',



                              // title: "You have 9 rewards waiting. Scratch - win - enjoy!",
                              subtitle: "Unlock now.",
                              time: '${notificationItem?.currDateTime?.time.toString() ?? ''} ${notificationItem?.currDateTime?.type.toString() ?? ''}\n ago',


                            );
                        },
                      ),
                    ),
                  ),
            ),




            //
            // ListView(
            //
            //   shrinkWrap: true,
            //   children: [
            //     const SizedBox(height: 20),
            //     _buildNotificationItem(
            //       context,
            //       icon: "assets/images/notification_coupon_reward.png",
            //       iconColor: Colors.orange,
            //       title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //       subtitle: "Unlock now.",
            //       time: "2h",
            //     ),
            //
            //
            //
            //
            //     _buildNotificationItem(
            //       context,
            //       icon: "assets/images/notification_coupon_reward.png",
            //       iconColor: Colors.orange,
            //       title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //       subtitle: "Unlock now.",
            //       time: "2h",
            //     ),
            //
            //
            //     _buildNotificationItem(
            //       context,
            //       icon: "assets/images/notification_coupon_reward.png",
            //       iconColor: Colors.orange,
            //       title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //       subtitle: "Unlock now.",
            //       time: "2h",
            //     ),
            //
            //
            //
            //     _buildNotificationItem(
            //       context,
            //       icon: "assets/images/notification_coupon_reward.png",
            //       iconColor: Colors.orange,
            //       title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //       subtitle: "Unlock now.",
            //       time: "2h",
            //     ),
            //
            //
            //     _buildNotificationItem(
            //       context,
            //       icon: "assets/images/notification_coupon_reward.png",
            //       iconColor: Colors.orange,
            //       title: "You have 9 rewards waiting. Scratch - win - enjoy!",
            //       subtitle: "Unlock now.",
            //       time: "2h",
            //     ),
            //
            //
            //
            //   ],
            // ),
            //


          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context,
      {

        required String icon,
        required Color iconColor,
        required String title,
        required String subtitle,
        required String time

      }) {


   //   print("imgaess ${icon}");


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(icon, height: 50,),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Text(
                //   subtitle,
                //   style: const TextStyle(fontSize: 14, color: Colors.grey),
                // ),

                const SizedBox(height: 15),



              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }


  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
