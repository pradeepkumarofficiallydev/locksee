import 'package:locksee/models/PrivacySettingAcceptedResponse.dart';
import 'package:locksee/models/UserDashboradDataResponse.dart';

import '../data/network/network_api_services.dart';
import '../models/GetPiiInformationResponse.dart';
import '../models/SurveyPreferencesQuestionResponse.dart';
import '../models/UserProfilesResponse.dart';
import '../utils/Strings.dart';

class  PrivacySettingsRepository {

  final _apinetwork = NetworkApiServices();



  Future<PrivacySettingAcceptedResponse>getAcceptedDateApi() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}privacy_setting/accepted_date');

    return PrivacySettingAcceptedResponse.fromJson(response);
  }



  Future<GetPiiInformationResponse>getPiiInformationApi() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}privacy_setting/get_pii_information');


    return GetPiiInformationResponse.fromJson(response);
  }





  Future<SurveyPreferencesQuestionResponse>getSurPrefeQuestionMmergeApi() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}privacy_setting/survey_preferences_question_merge');


    return SurveyPreferencesQuestionResponse.fromJson(response);
  }







}