import '../data/network/network_api_services.dart';
import '../models/GetRewardsResponse.dart';
import '../models/LoginResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../utils/Strings.dart';

class RedemptionRepository {
  final _apinetwork = NetworkApiServices();

  Future<RegisterResponse> registerAPI(Map<String, dynamic> map) async {
    dynamic response = await _apinetwork.postApi(map, "/signup/signup");

    return RegisterResponse.fromJson(response);
  }

  Future<GetRewardsResponse> redemptionApi() async {
    dynamic response = await _apinetwork.getApi("/rewards_tab/rewardTabdata");return GetRewardsResponse.fromJson(response);


  }




}
