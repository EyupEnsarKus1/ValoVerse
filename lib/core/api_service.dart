import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResponse<T> {
  ResponseType type;
  T? data;

  ApiResponse({required this.type, required this.data});
}

class ApiResponseHandler {
  static ApiResponse<T> handleResponse<T>(
    http.Response response, {
    required T Function(http.Response response) onSuccess,
    required ApiResponse<T> Function(http.Response response) onError,
  }) {
    if (response.statusCode == 200) {
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
  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );

    return response;
  }

  // Post request
  Future<dynamic> post(String endpoint, {dynamic body, Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: headers,
    );

    return _processResponse(response);
  }

  // Put request
  Future<dynamic> put(String endpoint, {dynamic body, Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
      headers: headers,
    );

    return _processResponse(response);
  }

  // Delete request
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );

    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}

enum ResponseType { success, error }
