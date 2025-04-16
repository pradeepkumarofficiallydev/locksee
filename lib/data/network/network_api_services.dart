
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/Preference.dart';
import '../../utils/SecureStorageService.dart';
import '../../utils/Strings.dart';
import '../AppExceptions.dart';
import 'base_api_services.dart';

import 'package:fluttertoast/fluttertoast.dart';

class NetworkApiServices extends BaseApiServices {

  static final NetworkApiServices _instance = NetworkApiServices._internal();

  // Private constructor to prevent instantiation
  NetworkApiServices._internal() {
    // Initialize the ApiClient (which sets up Dio with interceptors)
    ApiClient();
    _getSharedPreferences();
  }

  factory NetworkApiServices() {
    return _instance;
  }



  String? accessToken="";


  final Dio dio = Dio(BaseOptions(
    baseUrl: Strings.Url,


    // Can be modified for other URLs
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
   // headers: {'Content-Type': 'application/json'},
  ));





  Future<void> _getSharedPreferences()
  async {

    final SecureStorageService storageService = SecureStorageService();
    // Retrieve token
    accessToken = await storageService.getAccessToken();
    print("Stored Token: $accessToken");

   // accessToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvYmoiOnsicm9sZSI6MSwidXNlcmlkIjoxMTY3ODI3NCwiZmlyc3RfbmFtZSI6InZpc2hhbCBqaSIsImxhc3RfbmFtZSI6IkRpeGl0IiwidXNlcm5hbWUiOiJkaXhpdHZpc2hhbGRpeGl0OTA4NEBnbWFpbC5jb20iLCJwaG9uZV9ubyI6IjkwODQwMjY4MTgiLCJsYW5ndWFnZV9pZCI6MSwibGFuZ19jb2RlIjoiRU4iLCJjdWx0dXJlX2lkIjoiNCIsInVzZXJfbG9jYXRpb24iOiJVUyIsImNvdW50cnlfaWQiOjEwMiwiaW1hZ2VfbmFtZSI6Imh0dHBzOi8vd3d3Lm9waW5pb25idXJlYXUuY29tL0RvY3VtZW50L1BhbmVsaXN0X3BpY3NfZW5jcnlwdGVkLy5wbmciLCJpcF9hZGRyZXNzIjoiMTE1LjI0Ni4xMjAuMjA2IiwibWVtYmVyc2luY2V5ZWFyIjoyMDI1LCJtZW1iZXJzaGlwX3N0YXR1cyI6IlAiLCJjdXJyZW5jeV9zeW1ib2wiOiLigrkiLCJkZW1vX3N1cnZleV90YWtlbiI6IlkiLCJ0aW1lWm9uZSI6IkFzaWEvQ2FsY3V0dGEiLCJjb3VudHJ5X2NvZGUiOiJJTiJ9LCJpYXQiOjE3Mzk1MzE5OTB9.401T9IDyMM1YKyUjTNRePoqxvscaIdoSff2vTrQCiKk";

    // Delete token
    // await storageService.deleteAccessToken();









  }




  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to: ${options.uri}');

        print('Sending request to: ${options.uri}');
        print('Request Headers: ${options.headers}');
        print('Request Body: ${options.data}');



        return handler.next(options);
      },
      onResponse: (response, handler) {

        print('Received responsess: ${response.statusCode}');


        print('Received: ${response.data}');


        return handler.next(response);


      },
      onError: (DioException e, handler) async {


        int retryCount = 0;
        int maxRetries = 3;
        while (retryCount < maxRetries && e.type == DioExceptionType.connectionTimeout) {
          retryCount++;
          try {


            print('Connection timeout, retrying...');
            final res = await dio.request(e.requestOptions.path);
            return handler.resolve(res);
          } catch (e) {
            print(e.toString());
          }
        }
        return handler.next(e);
      },
    ));

  }


  @override
  Future getApi(String url , {  Map<String, dynamic>? queryParams  }) async {
    dynamic responseJson;


    await _getSharedPreferences();

    try {
      print("eehdehdeh:${accessToken}") ;

           // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

            var response = await dio.get(url,
              queryParameters: queryParams,
              options: Options(

                headers: {

                  "Authorization": "Bearer $accessToken",
                  "Content-Type": "multipart/form-data",
                 // 'x-access-token': accessToken,
                },
              ),
            );


      print("tttttststs" + response.data.toString());

      responseJson = returnResponse(response);

      print("heloo");


    } on SocketException {


      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;






  }

  @override
  Future postApi(Map<String, dynamic> map, url) async {
    dynamic responseJson;
    try {


      print("first 1" );



      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      var response = await dio.post(url,data: map,
          options: Options(

            headers: {
              'x-access-token': accessToken,
            },
          )



      );



      print("tttttststs" + response.data.toString());

      responseJson = returnResponse(response);
    } on
     DioException catch (e) {


      print('DioException: ${e.message}');


      print("Dio Error: ${e.message}");
      print("Dio Type: ${e.type}");
      print("Dio Error: ${e.error}");

      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');


        if (e.response!.statusCode == 404) {


          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,


            fontSize: 16.0,
          );


          throw InvalidUrl('Bad request: ${e.response!.data}');
        }


        else

        if (e.response!.statusCode == 400) {


          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,


            fontSize: 16.0,
          );


          throw InvalidUrl('Bad request: ${e.response!.data}');
        }


        else


        if



        (e.response!.statusCode == 201) {
          throw InvalidUrl('201 request: ${e.response!.data}');
        }

        else {
          throw FetchDataException(
              'Error occurred while communicating with server');
        }
      }
    }
    on

    SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;
  }






  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200||201:
    //    dynamic responsejson = jsonDecode(response.body);



        dynamic responsejson = response.data;





        print(response.statusCode);
        return responsejson;








      case 400:
        throw InvalidUrl;
      default:
        throw FetchDataException("Error occurred while communicating with server");
    }
  }








}

