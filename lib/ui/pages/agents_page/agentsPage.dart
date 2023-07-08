import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_state.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';

import '../../../bloc/agents_bloc/agents_event.dart';
import '../../../repositories/agents_repository/agents_repo.dart';

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
        appBar: const CustomAppBar(
          title: LocaleKeys.home_agents,
          centerTitle: true,
          showBackButton: true,
        ),
        body: BlocBuilder<AgentsBloc, AgentsState>(
          builder: (context, state) {
            if (state is AgentsLoadingState) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ShimmerBox(
                    width: 100,
                    height: 100,
                    borderRadius: 8.0,
                  );
                },
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
              return const Center(
                child: Text("Unexpected state"),
              );
            }
          },
        ),
      ),
    );
  }
}
