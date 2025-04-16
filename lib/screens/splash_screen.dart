import 'dart:async';
import 'package:flutter/material.dart';
import '../Utils/Preference.dart';
import '../utils/AppColors.dart';
import '../utils/SecureStorageService.dart';
import 'OnboardingScreen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _PartySplashScreenState createState() => _PartySplashScreenState();
}

class _PartySplashScreenState extends State<SplashScreen> {
  double progressValue = 0.0;
  // bool isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    isFirstTime();
    startProgressAnimation();


  }


  String? accessToken ="";
  Future<void> isFirstTime() async {

    final SecureStorageService storageService = SecureStorageService();
    accessToken = await storageService.getAccessToken();
    print("Stored Token: $accessToken");



    // isFirstTimeUser = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) ?? true;
    //
    // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
    //
    //
    // print("cdlcldcd  ${Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) }");





   }

  void startProgressAnimation() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.04;
        } else {
          timer.cancel();
          navigateToNextScreen();
        }
      });
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(

         builder: (context) => (accessToken==null|| accessToken=="")? Onboardingscreen() : HomeScreen(),


      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.3; // Child image size (30% of screen width)

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/Welcome.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Centered Child Image
          Center(
            child: Image.asset(
              "assets/images/lock_image.png",
              width: imageSize,
              height: imageSize,
            ),
          ),
        ],
      ),
    );
  }
}
