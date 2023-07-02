import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResponse<T> {
  ResponseType type;
  T? data;

  ApiResponse({required this.type, this.data});
}

class ApiResponseHandler {
  static ApiResponse<T?> handleResponse<T>(
    http.Response response, {
    required T Function(http.Response) onSuccess,
    required ApiResponse<T?> Function(http.Response) onError,
  }) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ApiResponse(
        type: ResponseType.success,
        data: onSuccess(response),
      );
    } else {
      return onError(response);
    }
  }
}

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  // Get request
  Future<ApiResponse<T?>> get<T>(
    String endpoint,
    T Function(dynamic data) fromJson, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);
    return _processResponse(response, fromJson);
  }

  // Post request
  Future<ApiResponse<T?>> post<T>(
    String endpoint,
    T Function(dynamic data) fromJson, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: headers,
    );

    return _processResponse(response, fromJson);
  }

  // Put request
  Future<ApiResponse<T?>> put<T>(String endpoint, T Function(dynamic data) fromJson, {dynamic body, Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: headers,
    );

    return _processResponse(response, fromJson);
  }

  // Delete request
  Future<ApiResponse<T?>> delete<T>(String endpoint, T Function(dynamic data) fromJson, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );

    return _processResponse(response, fromJson);
  }

  ApiResponse<T?> _processResponse<T>(http.Response response, T Function(dynamic data) fromJson) {
    return ApiResponseHandler.handleResponse<T?>(
      response,
      onSuccess: (response) {
        dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
        return fromJson(data);
      },
      onError: (response) {
        return ApiResponse<T>(
          type: ResponseType.error,
          data: null,
        );
      },
    );
  }
}

enum ResponseType { success, error }
