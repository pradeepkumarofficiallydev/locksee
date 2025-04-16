import 'package:locksee/models/GetEducationDetailsResponse.dart';
import 'package:locksee/models/UserProfilesResponse.dart';

import '../data/network/network_api_services.dart';
import '../models/LoginResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/UserEducationProfilesResponse.dart';
import '../utils/Strings.dart';

class  MyProfileRepository {

  final _apinetwork = NetworkApiServices();



  Future<LoginResponse>loginAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/login");

    return LoginResponse.fromJson(response);
  }





  Future<UserProfilesResponse>getUserProfileAPI() async
  {

    dynamic response = await _apinetwork.getApi(
     '${Strings.Url}user/+919520583930');

    return UserProfilesResponse.fromJson(response);
  }










  Future<GetEducationDetailsResponse>getEducationDetailsApi() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}basic_info/getquestiontypeanswer');

    return GetEducationDetailsResponse.fromJson(response);
  }









  Future<UserEducationProfilesResponse>getUserEducationDetailsApi() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}basic_info/getUserAnswerOfquestionList');

    return UserEducationProfilesResponse.fromJson(response);
  }




}