import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/repositories/agents_repository/generic_agents_repo.dart';

import '../../core/api_service.dart';

class AgentsRepo implements GenericAgentsRepository {
  final ApiService apiService =
      ApiService(baseUrl: "https://valorant-api.com/v1");

  @override
  Future<AgentsData> getAgentsById(String id) async {
    final ApiResponse<AgentsData?> response = await apiService.get<AgentsData>(
      'agents/$id',
      (data) => AgentsData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load agent data');
    }
  }

  @override
  Future<List<AgentsData>> getAllAgents() async {
    final ApiResponse<List<AgentsData>?> response =
        await apiService.get<List<AgentsData>>(
      'agents',
      (data) => (data['data'] as List)
          .map((agent) => AgentsData.fromJson(agent as Map<String, dynamic>))
          .toList(),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load agents data');
    }
  }
}
