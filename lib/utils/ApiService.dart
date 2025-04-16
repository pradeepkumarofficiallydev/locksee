import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> sendDataToServer(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('https://yourserver.com/api/data', data: data);
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data');
      }
    } catch (e) {
      print('Error while sending data: $e');
    }
  }
}
