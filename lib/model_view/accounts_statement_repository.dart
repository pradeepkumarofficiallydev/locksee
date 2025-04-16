import 'package:locksee/models/PointsTagsResponse.dart';
import 'package:locksee/models/RewardsAllListDataResponse.dart';

import '../data/network/network_api_services.dart';
import '../models/LoginResponse.dart';
import '../models/PointsAllListDataResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/RewardsTagsResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../models/SurveyHistoryListDataResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../utils/Strings.dart';

class  AccountsStatementRepository {

  final _apinetwork = NetworkApiServices();




  Future<LoginResponse>loginAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/login");

    return LoginResponse.fromJson(response);


  }




  Future<RewardsTagsResponse>rewardsCategoryListingApi(   ) async
  {
    dynamic response = await _apinetwork.getApi("/rewards_tab/rewards_category_listing");

    return RewardsTagsResponse.fromJson(response);



  }





  Future<PointsTagsResponse>pointsCategoryListingApi(   ) async
  {
    dynamic response = await _apinetwork.getApi("/points_tab/get_points_category");

    return PointsTagsResponse.fromJson(response);



  }




  Future<RewardsAllListDataResponse>RewardsAllListDataApi(int category, int skip ,String formDate ,String toDate, Map<String, dynamic> queryParams ) async
  {

    dynamic response = await _apinetwork.getApi("${Strings.Url}rewards_tab/rewardTabdata",queryParams:queryParams);
    return RewardsAllListDataResponse.fromJson(response);

  //  "${Strings.Url}rewards_tab/rewardTabdata?limit=10&category=${category}&skip=${skip}&dateFrom=${formDate}&dateTo=${toDate}"



  }




  Future<PointsAllListDataResponse>pointssAllListDataApi(int category, int skip ,String formDate ,String toDate, Map<String, dynamic> queryParams ) async
  {

    dynamic response = await _apinetwork.getApi("${Strings.Url}points_tab/point_converted_merge",queryParams:queryParams);
    return PointsAllListDataResponse.fromJson(response);

    //  "${Strings.Url}rewards_tab/rewardTabdata?limit=10&category=${category}&skip=${skip}&dateFrom=${formDate}&dateTo=${toDate}"



  }







  Future<SurveyHistoryListDataResponse>surveyHistoryListDataApi(int category, int skip ,String formDate ,String toDate, Map<String, dynamic> queryParams ) async
  {

    dynamic response = await _apinetwork.getApi("${Strings.Url}survey_history_tab/get_list_of_status",queryParams:queryParams);
    return SurveyHistoryListDataResponse.fromJson(response);

    //  "${Strings.Url}rewards_tab/rewardTabdata?limit=10&category=${category}&skip=${skip}&dateFrom=${formDate}&dateTo=${toDate}"




  }









}