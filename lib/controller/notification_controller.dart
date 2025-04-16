import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locksee/models/NotificationResponse.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../model_view/notification_repository.dart';
import '../models/LoginResponse.dart';
import '../models/MasternotificationlistResponse.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;

  final api = NotificationRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final notififcationResponse = NotififcationResponse().obs;

  final masternotificationlistResponse = MasternotificationlistResponse().obs;

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

    notification_fun();

    masternotificationlist_fun();

    //
    // print(" argument ${data['firstName']}");
    //
    // firstName=data['firstName'];
    // lastName=data['lastName'];
    // emailId=data['emailId'];
    // mobile=data['mobile'];
    // password=data['password'];
  }

  void notification_fun() async {
    isLoading(true);
    update();

    {}

    api.notificationAPI().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      notififcationResponse.value = value;

      isLoading(false);
      update();

      if (notififcationResponse.value.success == true) {
        // Navigator.pushNamed(Get. context!,
        //   '/home_screen',
        //
        //   //  arguments:data
        // );
        //
        //
        //
      }

      print("my final response ${notififcationResponse.value.data?.first}");

      // print( "myfinalResponsesss:${registerResponse?.value!.??""}");
    }).onError((error, stackTrace) {
      isLoading(false);

      print("errrors${error}");

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void masternotificationlist_fun() async {
    isLoading(true);
    update();

    {}

    api.masternotificationlistAPI().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      masternotificationlistResponse.value = value;

      isLoading(false);
      update();

      if (masternotificationlistResponse.value.success == true) {
        // Navigator.pushNamed(Get. context!,
        //   '/home_screen',
        //
        //   //  arguments:data
        // );
        //
        //
        //
      }

      print(
          "my final response ${masternotificationlistResponse.value.data?.notifications.toString()}");
    }).onError((error, stackTrace) {
      isLoading(false);

      print("errrors${error}");

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void _getSharedPreferences() {
    //
    // user_name= Preference.shared?.getString(Preference.USER_NAME)??"";
    // user_email=Preference.shared?.getString(Preference.USER_EMAIL_ID)??"";
    // user_mobile_no= Preference.shared?.getString(Preference.USER_MOBILE)?? "";
    // add_range= Preference.shared?.getString(Preference.ADD_RANGE)??"";
    // cap_distance= Preference.shared?.getString(Preference. CAP_DISTANCE)??"";
    // userVehicaleImage= Preference.shared?.getString(Preference. USER_VEHICALE_IMAGE)??"";
    //
    //
    // userVehicaleName= Preference.shared?.getString(Preference. USER_VEHICALE_NAME)??"";
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
