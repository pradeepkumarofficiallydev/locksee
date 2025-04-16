import 'package:locksee/models/UserDashboradDataResponse.dart';

import '../data/network/network_api_services.dart';
import '../models/UserProfilesResponse.dart';
import '../utils/Strings.dart';

class  HomeRepository {

  final _apinetwork = NetworkApiServices();
  final _apinetwork1 = NetworkApiServices();

  Future<UserDashboradDataResponse> getUserDataApi() async
  {

         dynamic response = await _apinetwork.getApi(
             Strings.Url+"dashboard/dashboard");
         return UserDashboradDataResponse.fromJson(response);


  }





  Future<UserProfilesResponse>getUserProfileAPI() async
  {

    dynamic response = await _apinetwork.getApi(
        '${Strings.Url}basic_info/basic_info');

    return UserProfilesResponse.fromJson(response);
  }


  }