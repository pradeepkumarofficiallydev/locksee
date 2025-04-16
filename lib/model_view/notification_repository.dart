import 'package:locksee/models/MasternotificationlistResponse.dart';

import '../data/network/network_api_services.dart';
import '../models/NotificationResponse.dart';


class  NotificationRepository {

  final _apinetwork = NetworkApiServices();



  Future<NotififcationResponse>notificationAPI() async
  {


    dynamic response = await _apinetwork.getApi(
         "/notification/newnotification");

    return NotififcationResponse.fromJson(response);
  }




  Future<MasternotificationlistResponse>masternotificationlistAPI() async
  {


    dynamic response = await _apinetwork.getApi(
        "/notification/masternotificationlist");

    return MasternotificationlistResponse.fromJson(response);



  }





}