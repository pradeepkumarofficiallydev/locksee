import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:locksee/models/PrivacySettingAcceptedResponse.dart';

import '../data/response/status.dart';
import '../model_view/privacy_settings_repository.dart';
import '../models/GetPiiInformationResponse.dart';
import '../models/SurveyPreferencesQuestionResponse.dart';

class PrivacySettingController extends GetxController {
  var isLoading = false.obs;

  final api = PrivacySettingsRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;

  Map<int, int> selectedAnswers = {};

  final privacySettingAcceptedResponse = PrivacySettingAcceptedResponse().obs;

  final getPiiInformationResponse = GetPiiInformationResponse().obs;

  final surveyPreferencesQuestionResponse =
      SurveyPreferencesQuestionResponse().obs;

  var isChecked = false.obs; // Initial state

  String user_mobile_no = "";
  var data = Get.arguments;



  @override
  void onInit() {
    super.onInit();
    _getSharedPreferences();
    getUserHomeDataFun();
    getPiiInformationFun();
    getSurPrefeQuestionMmergeFun();
  }



  //
  // void setDefaultAnswers() {
  //   var questions =
  //       surveyPreferencesQuestionResponse.value?.data?.questions ?? [];
  //   for (var question in questions) {
  //     if (question.privacySelectedAns!.isNotEmpty) {
  //       selectedAnswers[question.questionId!] =
  //           int.tryParse(question.privacySelectedAns!.first.answer)!;
  //
  //     }
  //
  //
  //
  //   }
  //
  //   update();
  //
  //
  // }







  void setDefaultAnswers() {
    var questions = surveyPreferencesQuestionResponse.value?.data?.questions ?? [];

    for (var question in questions) {
      if (question.privacySelectedAns != null && question.privacySelectedAns!.isNotEmpty) {

      print('first1');


         String answerValue = question.privacySelectedAns!.first.answer.toString(); // Convert to String

      print(answerValue);



         int? selectedAnswer = int.tryParse(answerValue); // Try parsing as an integer

        if (selectedAnswer != null) {
          selectedAnswers[question.questionId!] = selectedAnswer;
        }
      }
    }


    update();


    //selectedAnswers.refresh(); // Ensures UI updates if using Obx()
  }

 //  void setDefaultAnswers() {
 //    var questions = surveyPreferencesQuestionResponse.value?.data?.questions ?? [];
 //
 //    for (var question in questions) {
 //      if (question.privacySelectedAns != null && question.privacySelectedAns!.isNotEmpty) {
 //        int? selectedAnswer = int.tryParse(question.privacySelectedAns!.first.answer ?? "");
 //
 //        if (selectedAnswer != null) {
 //          selectedAnswers[question.questionId!] = selectedAnswer;
 //        }
 //      }
 //    }
 //
 //    update() ;
 //
 //
 //
 //
 // //   selectedAnswers.refresh(); // Ensures UI updates if using Obx()
 //  }
 //



  void getSelectedAnswers() {
    List<Map<String, dynamic>> selectedData = selectedAnswers.entries.map((entry) {
      return {
        "question_id": entry.key, // Question ID
        "selected_answer_id": entry.value // Selected Answer ID
      };
    }).toList();


    print(selectedData); // Print or send this data to an API
  }






  void updateAnswer(int questionId, int answerId) {
    selectedAnswers[questionId] = answerId;

    update();

    print("Updated answer: Question $questionId -> Answer $answerId");
  }




  void getUserHomeDataFun() async {
    isLoading(true);
    update();
    api.getAcceptedDateApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      privacySettingAcceptedResponse.value = value;

      isLoading(false);
      update();

      print("final response ${privacySettingAcceptedResponse.value}");
    }).onError((error, stackTrace) {
      isLoading(false);

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void getPiiInformationFun() async {
    isLoading(true);
    update();
    api.getPiiInformationApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      getPiiInformationResponse.value = value;

      isLoading(false);
      update();

      if (getPiiInformationResponse.value.data?.piiInfoStatus == 0) {
        isChecked(true);
        update();
      } else {
        isChecked(false);
        update();
      }

      print("final response ${getPiiInformationResponse.value}");
    }).onError((error, stackTrace) {
      isLoading(false);

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void getSurPrefeQuestionMmergeFun() async {
    isLoading(true);
    update();
    api.getSurPrefeQuestionMmergeApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      surveyPreferencesQuestionResponse.value = value;




      setDefaultAnswers();


      isLoading(false);
      update();

      // if (getPiiInformationResponse.value.data?.piiInfoStatus == 0) {
      //   isChecked(true);
      //   update();
      // } else {
      //   isChecked(false);
      //   update();
      // }



      print("final response ${getPiiInformationResponse.value}");
    }).onError((error, stackTrace) {
      isLoading(false);

      print( 'error response ${error.toString() }');




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

  String formatDate(String? dateStr) {
    if (dateStr == null) return "Invalid date"; // Handle null input

    DateTime? dateTime = DateTime.tryParse(dateStr);
    if (dateTime == null) return "Invalid date"; // Handle invalid date formats

    return DateFormat("d MMM yyyy").format(dateTime);
  }
}
