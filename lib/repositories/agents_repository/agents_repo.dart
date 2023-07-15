import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

import '../../core/api_service.dart';

class AgentsRepo implements IGenericRepo<AgentsData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<AgentsData>> getAllData() async {
    final ApiResponse<List<AgentsData>?> response =
        await apiService.get<List<AgentsData>>(
      PageEnums.agents.name,
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

  @override
  Future<AgentsData> getDataById(String id) async {
    final ApiResponse<AgentsData?> response = await apiService.get<AgentsData>(
      '${PageEnums.agents.name}/$id',
      (data) => AgentsData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load agent data');
    }
  }
}
