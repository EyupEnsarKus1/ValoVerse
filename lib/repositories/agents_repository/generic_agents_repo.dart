import '../../models/agents_data.dart';

abstract class GenericAgentsRepository {
  Future<List<AgentsData>> getAllAgents();
  Future<AgentsData> getAgentsById(String id);
}
