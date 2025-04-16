import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:locksee/models/GetEducationDetailsResponse.dart';
import 'package:locksee/models/PointsAllListDataResponse.dart';
import 'package:locksee/models/UserProfilesResponse.dart';

import '../data/response/status.dart';
import '../model_view/accounts_statement_repository.dart';
import '../model_view/auth_repository.dart';
import '../model_view/my_profile_repository.dart';
import '../models/PointsTagsResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/RewardsAllListDataResponse.dart';
import '../models/RewardsTagsResponse.dart';
import '../models/SurveyHistoryListDataResponse.dart';
import '../models/UserEducationProfilesResponse.dart';

class AccountsStatementController extends GetxController {
  var isLoading = false.obs;

  var isLoading1 = false.obs;

  final api = AccountsStatementRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final userProfilesResponse = UserProfilesResponse().obs;
  final getEducationDetailsResponse = GetEducationDetailsResponse().obs;
  final rewardsTagsResponse = RewardsTagsResponse().obs;

  final pointsTagsResponse = PointsTagsResponse().obs;

  // points_tab/get_points_category
  final rewardsAllListDataResponse = RewardsAllListDataResponse().obs;

  final pointsAllListDataResponse = PointsAllListDataResponse().obs;

  final surveyHistoryListDataResponse = SurveyHistoryListDataResponse().obs;



  late var queryTypes = [];









  String user_mobile_no = "";
  List<String> hightest_leve_education = [];
  List<String> hightest_leve_education_year = [];

  List<String> reward_tags_list = [];

  List<String> points_tags_list = [];

  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    _getSharedPreferences();

    rewardsAllListDataFun(0, 0, "", "");
    //rewardsAllListDataFun(0, 0, "", "");



    rewardsCategoryListingFun();

    pointsCategoryListingFun();


    pointsAllListDataFun(0, 0, "", "");

    SurveyHistoryListDataFun(0, 0, "", "");



  }

  void rewardsCategoryListingFun() async {
    isLoading(true);
    update();

    api.rewardsCategoryListingApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      rewardsTagsResponse.value = value;

      isLoading(false);
      update();

      //
      // if (getEducationDetailsResponse.value.data!.questions!= null && getEducationDetailsResponse.value.data!.questions!= null) {
      //   for (var question in getEducationDetailsResponse.value.data!.questions!.first.items!) {
      //     // if (question.answer != null) {
      //     //   for (var item in  question !) {
      //     hightest_leve_education.add(question.answer ?? ""); // Extract answer text
      //     // }
      //   }
      // }
      //
      //
      // if (getEducationDetailsResponse.value.data != null &&
      //     getEducationDetailsResponse.value.data!.questions != null &&
      //     getEducationDetailsResponse.value.data!.questions!.length > 1) {  // Ensure second item exists
      //   for (var item in getEducationDetailsResponse.value.data!.questions![1].items ?? []) {
      //     hightest_leve_education_year.add(item.answer ?? ""); // Extract answer text
      //   }
      // }
      //
      //
      //
      //
      //

      if (rewardsTagsResponse.value.data != null)
        reward_tags_list.add("All"); // Add "All" as the first item

      {
        // Ensure second item exists
        for (var item in rewardsTagsResponse.value.data!.data ?? []) {
          reward_tags_list.add(item.options ?? ""); // Extract answer text
        }
      }

      print("my final response ${rewardsTagsResponse.value.data.toString()}");
    }).onError((error, stackTrace) {
      isLoading(false);

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void pointsCategoryListingFun() async {
    // isLoading(true);
    // update();

    api.pointsCategoryListingApi().then((value) {
      rxRequestStatus.value = Status.COMPLETED;
      pointsTagsResponse.value = value;

      // isLoading(false);
     // update();

      //
      // if (getEducationDetailsResponse.value.data!.questions!= null && getEducationDetailsResponse.value.data!.questions!= null) {
      //   for (var question in getEducationDetailsResponse.value.data!.questions!.first.items!) {
      //     // if (question.answer != null) {
      //     //   for (var item in  question !) {
      //     hightest_leve_education.add(question.answer ?? ""); // Extract answer text
      //     // }
      //   }
      // }
      //
      //
      // if (getEducationDetailsResponse.value.data != null &&
      //     getEducationDetailsResponse.value.data!.questions != null &&
      //     getEducationDetailsResponse.value.data!.questions!.length > 1) {  // Ensure second item exists
      //   for (var item in getEducationDetailsResponse.value.data!.questions![1].items ?? []) {
      //     hightest_leve_education_year.add(item.answer ?? ""); // Extract answer text
      //   }
      // }
      //
      //
      //
      //
      //



      if (pointsTagsResponse.value.data != null) {

        points_tags_list.add("All"); // Add "All" as the first item

        for (var item in pointsTagsResponse.value.data!.data ?? []) {
          points_tags_list.add(item.options ?? ""); // Extract answer text

          /// print(reward_tags_list);
        }
      }
      update();


      print("my final response ${rewardsTagsResponse.value.data.toString()}");
    }).onError((error, stackTrace) {
      isLoading(false);

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  void pointsAllListDataFun(int category, int skip, String fromDate, String toDate) async {
    isLoading1(true);
    update();

    print("first section");

    Map<String, dynamic> queryParams = {};
    queryParams["limit"] = 10; // Always present
    if (category != null) queryParams["id"] = category;
    if (skip != null) queryParams["skip"] = skip;
    if (fromDate != null && fromDate.isNotEmpty)
      queryParams["dateFrom"] = fromDate;
    if (toDate != null && toDate.isNotEmpty) queryParams["dateTo"] = toDate;



    api.pointssAllListDataApi(category, skip, fromDate, toDate, queryParams)
        .then((value) {

      rxRequestStatus.value = Status.COMPLETED;
      pointsAllListDataResponse.value = value;
      print("my responsedd ${pointsAllListDataResponse.value.toString()}");

       isLoading1(false);
       update();

      //print("my fina ${rewardsAllListDataResponse.value .toString()}");
      //print("my fina ${rewardsAllListDataResponse.value .toString()}");
    }).onError((error, stackTrace) {
      isLoading1(false);
      update();

      print(error);

      // isLoading1(false);
      // update();
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }







  void SurveyHistoryListDataFun(int category, int skip, String fromDate, String toDate) async {
    isLoading1(true);
    update();

    print("first section");

    Map<String, dynamic> queryParams = {};
    queryParams["limit"] = 10; // Always present
    if (category != null) queryParams["id"] = category;
    if (skip != null) queryParams["skip"] = skip;
    if (fromDate != null && fromDate.isNotEmpty)
      queryParams["dateFrom"] = fromDate;
    if (toDate != null && toDate.isNotEmpty) queryParams["dateTo"] = toDate;



    api.surveyHistoryListDataApi(category, skip, fromDate, toDate, queryParams)
        .then((value) {

      rxRequestStatus.value = Status.COMPLETED;
      surveyHistoryListDataResponse.value = value;
      print("my responsedd ${pointsAllListDataResponse.value.toString()}");

      isLoading1(false);
      update();

      //print("my fina ${rewardsAllListDataResponse.value .toString()}");
      //print("my fina ${rewardsAllListDataResponse.value .toString()}");
    }).onError((error, stackTrace) {
      isLoading1(false);
      update();

      print(error);

      // isLoading1(false);
      // update();
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }






  void rewardsAllListDataFun(
      int category, int skip, String fromDate, String toDate) async {
    isLoading(true);
    update();

    print("first section");

    Map<String, dynamic> queryParams = {};
    queryParams["limit"] = 10; // Always present
    if (category != null) queryParams["category"] = category;
    if (skip != null) queryParams["skip"] = skip;
    if (fromDate != null && fromDate.isNotEmpty)
      queryParams["dateFrom"] = fromDate;
    if (toDate != null && toDate.isNotEmpty) queryParams["dateTo"] = toDate;

    api.RewardsAllListDataApi(category, skip, fromDate, toDate, queryParams)
        .then((value) {
      print("my response data  ${rewardsAllListDataResponse.value.toString()}");

      rxRequestStatus.value = Status.COMPLETED;
      rewardsAllListDataResponse.value = value;

      isLoading(false);
      update();

      //print("my fina ${rewardsAllListDataResponse.value .toString()}");
    }).onError((error, stackTrace) {
      // isLoading(false);
      // update();

      print(error);

      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });
  }

  String findAnswerByQuestionId(
      UserEducationProfilesResponse response, int questionId) {
    if (response.data == null || response.data!.data == null) {
      return "Not Found";
    }

    var result = response.data!.data?.firstWhere(
      (element) => element.questionId == questionId,
      orElse: () => EducationDetails(answer: "Not Found"),
    );

    /// print("${result!.answer!} dededed");

    if (questionId == 463) {
      var result1 = getEducationDetailsResponse
          .value.data?.questions!.first.items
          ?.firstWhere(
        (element) =>
            element.questionAnswerId == int.tryParse(result?.answer ?? ""),
        orElse: () => Items(answer: "Not Found"),
      );

      return result1?.answer ?? "Not Found";
    } else if (questionId == 464) {
      var result1 = getEducationDetailsResponse.value.data?.questions![1].items
          ?.firstWhere(
        (element) =>
            element.questionAnswerId == int.tryParse(result?.answer ?? ""),
        orElse: () => Items(answer: "Not Found"),
      );

      return result1?.answer ?? "Not Found";
    } else
    //if (questionId == 463)

    {
      var result1 = getEducationDetailsResponse.value.data?.questions![2].items
          ?.firstWhere(
        (element) =>
            element.questionAnswerId == int.tryParse(result?.answer ?? ""),
        orElse: () => Items(answer: "Select an item"),
      );

      return result1?.answer ?? "Select an item";
    }
  }

  void _getSharedPreferences() {





    queryTypes = [
      {
      "id": 1,
      "value": null,
        "name": '_all'.tr,
      },
      {

      "id": 2,
      "value": '4',
        "name": '_terminated'.tr,
      },
      {
      "id": 3,
      "value": '2',
        "name": '_qualifiedApprove'.tr,
      },
      {
      "id": 4,
      "value": '1',
        "name": '_qualifiedPending'.tr,
      },
      {
      "id": 5,
      "value": '3',
        "name": '_qualifiedRejected'.tr,
      },
      {
      "id": 6,
      "value": '6',
        "name": '_incomplete'.tr,
      },
      {
      "id": 7,
      "value": '5',
        "name": '_quotafull'.tr,
      },

    ];


    //
    // user_name= Preference.shared?.getString(Preference.USER_NAME)??"";


  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }



  String formatCustomDate(String dateString) {
    try {
      DateTime parsedDate = DateTime.parse(dateString);
      return "1 ${DateFormat('MMM').format(parsedDate)} ${parsedDate.year}"; // Returns "1 Jan 2025"
    } catch (e) {
      return "Invalid date";
    }
  }











}
