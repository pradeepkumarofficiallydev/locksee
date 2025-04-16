import 'dart:convert';
import 'package:dio/dio.dart';

class ApiClient {

  static final ApiClient _instance = ApiClient._internal();

  ApiClient._internal() {
    setupInterceptors();
  }
  factory ApiClient() {
    return _instance;
  }
  // Dio instance configuration
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com', // Can be modified for other URLs
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'Content-Type': 'application/json'},
  ));
  void setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to: ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Received response: ${response.statusCode}');
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



  // Example: Fetch posts from the API
  Future<List<dynamic>> fetchPosts() async {
    try {
      Response response = await dio.get('/posts');
      print('Fetched posts: ${response.data}');
      return response.data as List<dynamic>;
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  // Example: Fetch a single post by ID
  Future<Map<String, dynamic>> fetchPostById(int id) async {
    try {
      Response response = await dio.get('/posts/$id');
      print('Fetched post $id: ${response.data}');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error fetching post $id: $e');
      return {};
    }
  }

  // Example: Create a new post
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('/posts', data: data);
      print('Created post: ${response.data}');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error creating post: $e');
      return {};
    }
  }

  // Example: Update a post
  Future<Map<String, dynamic>> updatePost(int id, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put('/posts/$id', data: data);
      print('Updated post $id: ${response.data}');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error updating post $id: $e');
      return {};
    }
  }

  // Example: Delete a post
  Future<void> deletePost(int id) async {
    try {
      await dio.delete('/posts/$id');
      print('Deleted post $id');
    } catch (e) {
      print('Error deleting post $id: $e');
    }
  }
}


















//
//
//
//
//
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
//
// class ApiClient {
//   // Private static variable to hold the instance of the class
//   static final ApiClient _instance = ApiClient._internal();
//
//   // Private constructor to prevent instantiation
//   ApiClient._internal() {
//     // Calling the setupInterceptors method inside the constructor
//     setupInterceptors();
//
//
//   }
//
//   // Factory constructor to return the single instance
//   factory ApiClient() {
//     return _instance;
//   }
//
//   // Dio instance configuration
//   final Dio dio = Dio(BaseOptions(
//     baseUrl: 'https://jsonplaceholder.typicode.com', // Can be modified for other URLs
//     connectTimeout: const Duration(seconds: 5),
//     receiveTimeout: const Duration(seconds: 5),
//     headers: {'Content-Type': 'application/json'},
//   ));
//
//
//
//
//   // Interceptors to handle requests and responses
//   void setupInterceptors() {
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         print('Sending request to: ${options.uri}');
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         print('Received response: ${response.statusCode}');
//         return handler.next(response);
//       },
//       onError: (DioException e, handler) async {
//         int retryCount = 0;
//         int maxRetries = 3;
//         while (retryCount < maxRetries && e.type == DioExceptionType.connectionTimeout) {
//           retryCount++;
//           try {
//             print('Connection timeout, retrying...');
//             final res = await dio.request(e.requestOptions.path);
//             return handler.resolve(res);
//           } catch (e) {
//             print(e.toString());
//           }
//         }
//         return handler.next(e);
//       },
//     ));
//   }
//
//   // Example: Fetch posts from the API
//   Future<List<dynamic>> fetchPosts() async {
//     try {
//       Response response = await dio.get('/posts');
//       print('Fetched posts: ${response.data}');
//       return response.data as List<dynamic>;
//     } catch (e) {
//       print('Error fetching posts: $e');
//       return [];
//     }
//   }
//
//   // Example: Fetch a single post by ID
//   Future<Map<String, dynamic>> fetchPostById(int id) async {
//     try {
//       Response response = await dio.get('/posts/$id');
//       print('Fetched post $id: ${response.data}');
//       return response.data as Map<String, dynamic>;
//     } catch (e) {
//       print('Error fetching post $id: $e');
//       return {};
//     }
//   }
//
//   // Example: Create a new post
//   Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
//     try {
//       Response response = await dio.post('/posts', data: data);
//       print('Created post: ${response.data}');
//       return response.data as Map<String, dynamic>;
//     } catch (e) {
//       print('Error creating post: $e');
//       return {};
//     }
//   }
//
//   // Example: Update a post
//   Future<Map<String, dynamic>> updatePost(int id, Map<String, dynamic> data) async {
//     try {
//       Response response = await dio.put('/posts/$id', data: data);
//       print('Updated post $id: ${response.data}');
//       return response.data as Map<String, dynamic>;
//     } catch (e) {
//       print('Error updating post $id: $e');
//       return {};
//     }
//   }
//
//   // Example: Delete a post
//   Future<void> deletePost(int id) async {
//     try {
//       await dio.delete('/posts/$id');
//       print('Deleted post $id');
//     } catch (e) {
//       print('Error deleting post $id: $e');
//     }
//   }
// }


