import '../data/network/network_api_services.dart';
import '../models/LoginResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../utils/Strings.dart';

class  AuthRepository {

  final _apinetwork = NetworkApiServices();



  Future<RegisterResponse>registerAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/signup/signup");

    return RegisterResponse.fromJson(response);
  }



  Future<LoginResponse>loginAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "auth/send-otp");

    return LoginResponse.fromJson(response);
  }



  Future<OtpVerificationResponse>otpVeriAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "auth/verify-otp");

    return OtpVerificationResponse.fromJson(response);
  }










  Future<VerfiywhetherEmailMobResponse>verfiy_whether_email_mobApi(String username ) async
{dynamic response = await _apinetwork.getApi("/login/verify_whether_email_or_mobile?username=${username}");return VerfiywhetherEmailMobResponse.fromJson(response);
}





  Future<VerfiywhetherEmailMobResponse>on_language_call_Api(String username ) async
  {dynamic response = await _apinetwork.getApi("/language?country_code=${username}");return VerfiywhetherEmailMobResponse.fromJson(response);
  }



  Future<SendOTPResponse>send_otp(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/signup/send_sms_or_email_otp");

    return SendOTPResponse.fromJson(response);
  }




  Future<SignUpEmailMobileVerificationResponse>signUpEmailMobileVerificationApi(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/signup/signUpEmailMobileVerficationApi");

    return SignUpEmailMobileVerificationResponse.fromJson(response);
  }











// Future<LoginResponse>loginAPI(Map<String, dynamic> map) async
  // {
  //
  //   dynamic response = await _apinetwork.getApi(
  //        "/login");
  //
  //   return LoginResponse.fromJson(response);
  // }
  //











}