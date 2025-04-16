import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/my_profile_controller.dart';
import '../utils/AppColors.dart';
import '../utils/SecureStorageService.dart';
import 'login_screen.dart';



class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:



      GetBuilder<MyProfileController>(
        init: MyProfileController(),
    builder: (s) => Obx(()=>



      Column(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profiles_icon.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(

                     s. userProfilesResponse.value.result?.username??"",

                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Bio comes here", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          // Settings List
          Expanded(
            child: ListView(
              children: [
                _buildSettingsItem(Icons.lock, "Privacy"),
                _buildSettingsItem(Icons.wallpaper, "Wallpaper"),
                _buildSettingsItem(Icons.language, "Language", trailingText: "English"),
                _buildSettingsItem(Icons.settings, "Account settings"),
                _buildSettingsItem(
                  Icons.dark_mode,
                  "Dark mode",
                  trailingWidget: Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ),
                _buildSettingsItem(Icons.subscriptions, "Subscription"),
                _buildSettingsItem(Icons.person_add, "Invite a friend"),
                _buildSettingsItem(Icons.help_outline, "Help"),
                _buildSettingsItem(Icons.feedback, "Suggestions & feedback"),
                _buildSettingsItem(Icons.info_outline, "About us"),

                _buildSettingsItem(Icons.info_outline, "Log out"),

                // Footer Links
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Privacy policy", style: TextStyle(fontSize: 14, color: Colors.black)),
                      SizedBox(height: 5),
                      Text("Terms of service", style: TextStyle(fontSize: 14, color: Colors.black)),
                      SizedBox(height: 5),
                      Text("Raise a ticket", style: TextStyle(fontSize: 14, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),





            )
        // Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
      //     BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chats"),
      //     BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Connect"),
      //   ],
      // ),
    )
    );

  }

  Widget _buildSettingsItem(IconData icon, String title, {String? trailingText, Widget? trailingWidget}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: trailingWidget ??
          (trailingText != null
              ? Text(trailingText, style: const TextStyle(color: Colors.grey))
              : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)),
      onTap: () {




        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                //this right here
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Are you sure you want to Logout ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily:
                                    'MontserratAlternates'),
                              )),
                          Container(
                            // width: 100,
                            // height: 20,

                            margin: EdgeInsets.only(top: 25),

                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 20),

                                  // color: Color(0xFF024e7d),

                                  child: ElevatedButton(
                                    style: ElevatedButton
                                        .styleFrom(
                                      backgroundColor:
                                      AppColor.grayColor,
                                    ),

                                    onPressed: () async {
                                      //  Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);

                                      final SecureStorageService
                                      storageService =
                                      SecureStorageService();
                                      await storageService
                                          .deleteAccessToken();

                                      Get.offAll(LoginScreen());
                                    },

                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),

                                    // color: const Color(0xFF1BC0C5),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 20),

                                  // color: Color(0xFF024e7d),

                                  child: ElevatedButton(
                                    style: ElevatedButton
                                        .styleFrom(
                                        backgroundColor:
                                        Colors.black),

                                    onPressed: () {
                                      Navigator.pop(
                                          context, true);
                                    },

                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),

                                    // color: const Color(0xFF1BC0C5),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });













      },
    );
  }
}
