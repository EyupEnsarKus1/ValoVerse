import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_state.dart';

import '../../bloc/agents_bloc/agents_event.dart';
import '../../repositories/agents_repository/agents_repo.dart';

AgentsRepo agentsRepo = AgentsRepo();

class AgentsPage extends StatelessWidget {
  const AgentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AgentsBloc>(
      create: (_) {
        final bloc = AgentsBloc(agentsRepo);
        bloc.add(GetAgentsEvent());
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<AgentsBloc, AgentsState>(
          builder: (context, state) {
            if (state is AgentsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AgentsLoadedState) {
              return ListView.builder(
                itemCount: state.agentsData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.agentsData[index].displayName!,
                    ),
                  );
                },
              );
            } else if (state is AgentsErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Center(
                child: Text("Unexpected state"),
              );
            }
          },
        ),
      ),
    );
  }
}
