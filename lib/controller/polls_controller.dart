import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locksee/model_view/polls_repository.dart';
import 'package:locksee/models/GetPollQuestionAnswerResponse.dart';
import 'package:locksee/models/NotificationResponse.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../model_view/notification_repository.dart';
import '../models/LoginResponse.dart';
import '../models/MasternotificationlistResponse.dart';
import '../models/SavePollAnswersReesponse.dart';

class PollsController extends GetxController {
  var isLoading = false.obs;

  final api = PollsRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final getPollQuestionAnswerResponse = GetPollQuestionAnswerResponse().obs;


  final savepollanswersreesponse = Savepollanswersreesponse().obs;



  // Map to track selected options (poll ID → selected option index)
  var selectedOptions = <int, Map<String, int>>{}.obs;


  @override
  void onInit() {
    super.onInit();

    _getSharedPreferences();


    // isLoading(true);
    // update();
   get_polls_fun();




  }

  void selectOption(int pollId, int pollQuestionId, int pollAnswerId) {
    selectedOptions[pollId] = {
      "poll_question_id": pollQuestionId,
      "poll_answer_id": pollAnswerId
    };
    update(); // Refresh UI
  }







  void get_polls_fun() async {
    isLoading(true);
    update();



    api.GetPollApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      getPollQuestionAnswerResponse.value = value;

      isLoading(false);
      update();

      if (getPollQuestionAnswerResponse.value.success == true) {
        // Navigator.pushNamed(Get. context!,
        //   '/home_screen',
        //
        //   //  arguments:data
        // );
        //
        //
        //
      }

     // print("my final response ${getPollQuestionAnswerResponse.value.data?.first}");



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






  void save_poll_answers_fun()  async{

    isLoading(true);
    update();

    var map = new Map<String, dynamic>();
    map['poll_id'] = 1638;
    map['poll_question_id'] = 4152;
    map['poll_answer_id'] = 21354;
    map['reward_type'] = 75;





    print("My data ${map}");

    isLoading(true);


    update();


    api.SavePollAnswersAPI(map) .then((value)
    async {

      rxRequestStatus.value=Status.COMPLETED;
      savepollanswersreesponse.value=value;


      isLoading(false);
      update();

      //
      // if(loginResponse.value.success==true)
      // {
      //   await storageService.saveAccessToken(loginResponse.value.data?.token??"");
      //
      //
      //
      //
      //
      //   Get.offNamed('/dashboard', arguments: {'refresh': true});
      //
      //
      //
      // }
      //
      //
      // print("my final response ${loginResponse.value.data?.data.firstName }");


    }


    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }




  void submitVote(int pollId) {
    if (!selectedOptions.containsKey(pollId)) {
      Get.snackbar("Error", "Please select an option before voting.");
      return;
    }

    int pollQuestionId = selectedOptions[pollId]!["poll_question_id"]!;
    int selectedAnswerId = selectedOptions[pollId]!["poll_answer_id"]!;

    // Call API to submit vote
    print("Submitting vote:");
    print("Poll ID: $pollId");
    print("Poll Question ID: $pollQuestionId");
    print("Selected Answer ID: $selectedAnswerId");

    Get.snackbar("Success", "Your vote has been submitted.");
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
