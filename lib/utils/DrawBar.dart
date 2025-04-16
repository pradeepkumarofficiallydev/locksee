// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:locksee/controller/home_screen_controller.dart';
// import 'package:locksee/screens/home_screen.dart';
// import 'package:locksee/screens/live_survey_screen.dart';
// import 'package:locksee/screens/login_screen.dart';
// import 'package:locksee/screens/refer_earn_screen.dart';
// import 'package:locksee/utils/AppColors.dart';
//
// import '../screens/account_statement/account_statement_screen.dart';
// import '../screens/faqs_screen/faqs_screen.dart';
// import '../screens/global_insights_screen.dart';
// import '../screens/help_screen.dart';
// import '../screens/notification_screen.dart';
// import '../screens/privacy_settings_screen.dart';
// import '../screens/profiles_screen.dart';
// import 'Preference.dart';
// import 'SecureStorageService.dart';
// import 'app_text_styles.dart';
//
// class CustomMenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Container(
//       width: MediaQuery.of(context).size.width / 1.4,
//       child: GetBuilder<Homescreencontroller>(
//         init: Homescreencontroller(),
//         builder: (s) => Container(
//           color: AppColor.whiteColor,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User Info Section
//               GestureDetector(
//                 onTap: () {
//                   Get.to(TabBarExample());
//                 },
//                 child: Container(
//                   padding: EdgeInsets.only(top: 40, left: 30),
//                   alignment: Alignment.centerLeft,
//                   width: double.infinity,
//                   color: AppColor.appColor,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: height * 1.6, // Adjust size as needed
//                         height: height * 1.6,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white, // Background color
//                           image: s.imageBytes != null
//                               ? DecorationImage(
//                                   image: MemoryImage(s.imageBytes as Uint8List),
//                                   fit: BoxFit.cover,
//                                 )
//                               : null, // If no image, no background
//                         ),
//                       ),
//                       SizedBox(height: height * .3),
//                       Text(
//                         textAlign: TextAlign.center,
//                         '${s.userProfilesResponse.value.data?.name ?? ""} ${s.userProfilesResponse.value.data?.lastName ?? ""}',
//                         style: AppTextStyles.normalopenSans1(
//                             AppColor.blackColor, height * .5),
//                       ),
//                       Text(
//                         '${s.userProfilesResponse.value.data?.phoneNo ?? ""}',
//                         style: AppTextStyles.normalopenSans1(
//                             AppColor.blackColor, height * .4),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Menu Items
//               Expanded(
//                 child: ListView(
//                   children: [
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.home,
//                       "Home",
//                       () => _navigateTo(context, HomeScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.notifications_active_sharp,
//                       "Notifications",
//                       () => _navigateTo(context, NotificationsScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.person_off_outlined,
//                       "Account Statement",
//                       () => _navigateTo(context, AccountStatementScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.earbuds_battery,
//                       "Refer & Earn",
//                       () => _navigateTo(context, ReferAndEarnScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.camera_alt,
//                       "Latest Polls & Trends",
//                       () => _navigateTo(context, HomeScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.camera_alt,
//                       "Global insights",
//                       () => _navigateTo(context, global_insights_creen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.live_help,
//                       "Live Surveys",
//                       () => _navigateTo(context, LiveSurveyScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.privacy_tip_outlined,
//                       "Privacy & Settings",
//                       () => _navigateTo(context, PrivacySettingsApp()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.camera_alt,
//                       "FAQs",
//                       () => _navigateTo(context, FaqsScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.help_outline,
//                       "Help",
//                       () => _navigateTo(context, NeedHelpScreen()),
//                     ),
//                     _buildMenuItem(
//                       height,
//                       context,
//                       Icons.logout,
//                       "Log Out",
//                       () {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Dialog(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 //this right here
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 150,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(1.0),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                               alignment: Alignment.center,
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                 "Are you sure you want to Logout ?",
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.black,
//                                                     fontSize: 18,
//                                                     fontFamily:
//                                                         'MontserratAlternates'),
//                                               )),
//                                           Container(
//                                             // width: 100,
//                                             // height: 20,
//
//                                             margin: EdgeInsets.only(top: 25),
//
//                                             alignment: Alignment.center,
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                       bottom: 20),
//
//                                                   // color: Color(0xFF024e7d),
//
//                                                   child: ElevatedButton(
//                                                     style: ElevatedButton
//                                                         .styleFrom(
//                                                       backgroundColor:
//                                                           AppColor.grayColor,
//                                                     ),
//
//                                                     onPressed: () async {
//                                                       //  Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
//
//                                                       final SecureStorageService
//                                                           storageService =
//                                                           SecureStorageService();
//                                                       await storageService
//                                                           .deleteAccessToken();
//
//                                                       Get.offAll(LoginScreen());
//                                                     },
//
//                                                     child: Text(
//                                                       "Yes",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 14),
//                                                     ),
//
//                                                     // color: const Color(0xFF1BC0C5),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                       bottom: 20),
//
//                                                   // color: Color(0xFF024e7d),
//
//                                                   child: ElevatedButton(
//                                                     style: ElevatedButton
//                                                         .styleFrom(
//                                                             backgroundColor:
//                                                                 Colors.black),
//
//                                                     onPressed: () {
//                                                       Navigator.pop(
//                                                           context, true);
//                                                     },
//
//                                                     child: Text(
//                                                       "No",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 14),
//                                                     ),
//
//                                                     // color: const Color(0xFF1BC0C5),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             });
//
//                         // Add your logout functionality here
//                         print("User logged out");
//                       },
//                       isLogout: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper to navigate to a screen
//   void _navigateTo(BuildContext context, Widget screen,
//       {int stateId = 1, int districtId = 0}) {
//     //  Navigator.push(context, MaterialPageRoute(builder: (context) => screen ,),
//
//     Get.to(screen, arguments: {"stateId": stateId, "districtId": districtId});
//     //   );
//
//     Scaffold.of(context).closeDrawer(); // For closing
//
//     //  Get.off(screen);
//   }
//
//   // Menu Item
//   Widget _buildMenuItem(double height, BuildContext context, IconData icon,
//       String title, VoidCallback onTap,
//       {bool isLogout = false}) {
//     return Column(
//       children: [
//
//
//         ListTile(
//           leading: Icon(icon, color: isLogout ? Colors.red : Colors.black,size: height*.5,),
//           title: Text(
//             title,
//             style:
//             AppTextStyles.normalopenSans1(AppColor.blackColor, height * .4),
//           ),
//           onTap: onTap,
//         ),
//         Divider(
//           height: 0,
//           thickness: 2,
//         ), // Add another Divider here
//       ],
//     );
//   }}
