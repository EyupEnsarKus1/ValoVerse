import 'package:bloc/bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_event.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_state.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/agents_data.dart';
import 'package:valorant_wiki_app/repositories/agents_repository/agents_repo.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  final AgentsRepo agentsRepo;
  final LangCubit langCubit;
  AgentsBloc(this.agentsRepo, this.langCubit) : super(AgentsLoadingState()) {
    on<GetAgentsEvent>(_onLoadAgentsByAll);
    on<GetAgentByIdEvent>(_onLoadAgentById);
  }

  _onLoadAgentsByAll(GetAgentsEvent event, Emitter<AgentsState> emitter) async {
    try {
      emitter(AgentsLoadingState());
      final List<AgentsData> agentsData =
          await agentsRepo.getAllData(langCubit.state.locale);
      if (agentsData != null) {
        emitter(AgentsLoadedState(agentsData: agentsData));
      } else {
        emitter(AgentsErrorState(errorMessage: "agentsData is null"));
      }
    } catch (e) {
      emitter(AgentsErrorState(errorMessage: e.toString()));
    }
  }

  _onLoadAgentById(
      GetAgentByIdEvent event, Emitter<AgentsState> emitter) async {
    try {
      emitter(AgentsLoadingState());
      final AgentsData agentData = await agentsRepo.getDataById(event.id);
      if (agentData != null) {
        emitter(AgentsLoadedState(agentsData: [agentData]));
      } else {
        emitter(AgentsErrorState(errorMessage: "Failed to load agent data"));
      }
    } catch (e) {
      emitter(AgentsErrorState(errorMessage: e.toString()));
    }
  }
}
