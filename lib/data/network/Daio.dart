import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/Strings.dart';


class DioClient {

  static BaseOptions options = BaseOptions(baseUrl: Strings.Url);

  //Here is line you need
  CancelToken cancelToken=CancelToken();

  Dio _dio = Dio(options);

  Future<dynamic> postFormData()
        async {




  var map = new Map<String, dynamic>();
  map['date']="21/09/2023";
  map['phone']="9520583930";
  map['vehicle']="MG ZS EV";


   var formData = FormData.fromMap(map);

    try {
      //pass cancel token here
      var response = await _dio.post("get/schedule_time_new.php",
          options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",}), data: formData,cancelToken: cancelToken);



      print(response.data.toString());

      return response.data;
    } catch (e) {
      print(e.toString()) ;

    }}


  }
