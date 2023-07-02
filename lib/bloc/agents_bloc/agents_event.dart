abstract class AgentsEvent {}

class GetAgentsEvent implements AgentsEvent {}

class GetAgentByIdEvent implements AgentsEvent {
  final String id;

  GetAgentByIdEvent({required this.id});
}
