import 'package:valorant_wiki_app/models/agents_data.dart';

abstract class AgentsState {}

class AgentsLoadingState implements AgentsState {}

class AgentsLoadedState implements AgentsState {
  final List<AgentsData> agentsData;

  AgentsLoadedState({required this.agentsData});
}

class AgentsErrorState implements AgentsState {
  final String errorMessage;

  AgentsErrorState({
    required this.errorMessage,
  });
}
