import '../data/network/network_api_services.dart';
import '../models/GetPollQuestionAnswerResponse.dart';
import '../models/GetRewardsResponse.dart';
import '../models/LoginResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/SavePollAnswersReesponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../utils/Strings.dart';

class PollsRepository {
  final _apinetwork = NetworkApiServices();


  Future<GetPollQuestionAnswerResponse> GetPollApi() async {
    dynamic response = await _apinetwork.getApi("polls/poll_question_answer");return GetPollQuestionAnswerResponse.fromJson(response);


  }



  Future<Savepollanswersreesponse>SavePollAnswersAPI(Map<String, dynamic> map) async
  {

    dynamic response = await _apinetwork.postApi(
        map, "/polls/save_poll_answers");

    return Savepollanswersreesponse.fromJson(response);
  }





}
