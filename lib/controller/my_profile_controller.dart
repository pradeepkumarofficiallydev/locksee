import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locksee/models/GetEducationDetailsResponse.dart';
import 'package:locksee/models/UserProfilesResponse.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../model_view/my_profile_repository.dart';
import '../models/RegisterResponse.dart';
import '../models/UserEducationProfilesResponse.dart';

class MyProfileController extends GetxController {
  var isLoading = false.obs;

  final api = MyProfileRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final userProfilesResponse = UserProfilesResponse().obs;

  String user_mobile_no = "";
  List<String> hightest_leve_education = [];
  List<String> hightest_leve_education_year = [];

  List<String> hightest_leve_education_specialization = [];

  String firstName = "";
  String lastName = "";
  String emailId = "";
  String mobile = "";
  String password = "";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController firstAddressController = TextEditingController();

  TextEditingController secondAddressController = TextEditingController();

  TextEditingController cityAddressController = TextEditingController();

  TextEditingController zipcodeAddressController = TextEditingController();

  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    _getSharedPreferences();
    getUserProfileFun();

  }

  void getUserProfileFun() async {
    isLoading(true);
    update();

    api.getUserProfileAPI().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      userProfilesResponse.value = value;

      isLoading(false);
      update();





    }).onError((error, stackTrace) {
      isLoading(false);

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
