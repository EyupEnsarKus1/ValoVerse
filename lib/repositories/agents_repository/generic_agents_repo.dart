import '../../core/api_service.dart';
import '../../models/agents_data.dart';

abstract class GenericAgentsRepository {
  Future<ApiResponse<List<AgentsData>>> getAllAgents();
  Future<ApiResponse<AgentsData>> getAgentsById(String id);
}
