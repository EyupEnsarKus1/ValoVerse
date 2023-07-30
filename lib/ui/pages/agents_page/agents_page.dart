import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_bloc.dart';
import 'package:valorant_wiki_app/bloc/agents_bloc/agents_state.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/core/locale_keys.g.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';

import '../../../bloc/agents_bloc/agents_event.dart';
import '../../custom_widgets/custom_gridView.dart';
import '../../repo_implementation/repo_implementation.dart';
import 'agents_card.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AgentsBloc>(
      create: (_) {
        final bloc = AgentsBloc(agentsRepo, LangCubit(context: context));
        bloc.add(GetAgentsEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_agents.translate,
        ),
        body: BlocBuilder<AgentsBloc, AgentsState>(
          builder: (context, state) {
            if (state is AgentsLoadingState) {
              return CustomGridView(
                crossAxisCount: 2,
                aspectRatio: 1 / 2,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                verticalAxis: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      borderRadius: 8.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.size4,
                        vertical: AppSizes.size12,
                      ));
                },
              );
            } else if (state is AgentsLoadedState) {
              return CustomGridView(
                crossAxisCount: 2,
                aspectRatio: 1 / 2,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                verticalAxis: true,
                itemCount: state.agentsData.length,
                itemBuilder: (context, index) {
                  return AgentCard(
                    agentsData: state.agentsData[index],
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
