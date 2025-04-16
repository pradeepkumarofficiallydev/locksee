import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:locksee/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../model_view/redemption_repository.dart';
import '../models/GetRewardsResponse.dart';
import '../models/LoginResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../utils/Preference.dart';
import '../utils/SecureStorageService.dart';
import '../utils/translation_service.dart';
import 'package:intl/intl.dart';

class RedemptionRequestController extends GetxController {
  var email = "".obs;
  var deviceID = "Unknown".obs;
  var deviceName = "Unknown".obs;
  var deviceType = (Platform.isAndroid ? "android" : "ios").obs;
  var ipAddress = "192.168.0.1".obs; // Default
  var countryCode = "IN".obs; // Default
  var timeZone = "Asia/Kolkata".obs;
  var googleAdvId = "Unknown".obs;

  var counter = 30.obs; // OTP resend timer
  var isTimerRunning = false.obs;

  var isLoading = false.obs;
  var isLoading1 = false.obs;

  final SecureStorageService storageService = SecureStorageService();

  final api = RedemptionRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final loginResponse = LoginResponse().obs;
  final verfiywhetherEmailMobResponse = VerfiywhetherEmailMobResponse().obs;
  final getRewardsResponse = GetRewardsResponse().obs;

  String otp = "";

  var isUserPassword = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  String user_mobile_no = "";

  String firstName = "";
  String lastName = "";
  String emailId = "";
  String mobile = "";
  String password = "";

  var isPasswordVisible = false.obs;

  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    _getSharedPreferences();

    getRewardsData();


  }


  void _getSharedPreferences() {
    // country_code= Preference.shared?.getString(Preference.COUNTRY_CODE)??"";
    // user_email=Preference.shared?.getString(Preference.USER_EMAIL_ID)??"";
    // user_mobile_no= Preference.shared?.getString(Preference.USER_MOBILE)?? "";
    // add_range= Preference.shared?.getString(Preference.ADD_RANGE)??"";
    // cap_distance= Preference.shared?.getString(Preference. CAP_DISTANCE)??"";
    // userVehicaleImage= Preference.shared?.getString(Preference. USER_VEHICALE_IMAGE)??"";
    //
    //

    timeZone.value = Preference.shared?.getString(Preference.TIME_ZONE) ?? "";

    countryCode.value =
        Preference.shared?.getString(Preference.COUNTRY_CODE) ?? "";

    ///  print(countryCode);
  }


  void getRewardsData() async {
    isLoading1(true);
    update();




    api.redemptionApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      getRewardsResponse.value = value;

      isLoading1(false);
      update();






    }).onError((error, stackTrace) {
      isLoading1(false);
      update();

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }


  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }




}
