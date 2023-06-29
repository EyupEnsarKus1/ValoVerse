import 'dart:convert';

import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/repositories/agents_repository/generic_agents_repo.dart';

import '../../core/api_service.dart';

class AgentsRepo implements GenericAgentsRepository {
  final ApiService apiService = ApiService(baseUrl: "https://valorant-api.com/v1/");

  @override
  Future<ApiResponse<AgentsData>> getAgentsById(String id) async {
    final response = await apiService.get('agents/$id');

    return ApiResponseHandler.handleResponse<AgentsData>(
      response,
      onSuccess: (response) {
        return AgentsData.fromJson(
          jsonDecode(response.body),
        );
      },
      onError: (response) => ApiResponse(
        type: ResponseType.error,
      ),
    );
  }

  @override
  Future<ApiResponse<List<AgentsData>>> getAllAgents() async {
    final response = await apiService.get('agents');
    return ApiResponseHandler.handleResponse<List<AgentsData>>(
      response,
      onSuccess: (response) {
        return (jsonDecode(response.body)['data'] as List)
            .map(
              (agent) => AgentsData.fromJson(
                agent as Map<String, dynamic>,
              ),
            )
            .toList();
      },
      onError: (_) => ApiResponse(
        type: ResponseType.error,
      ),
    );
  }
}
