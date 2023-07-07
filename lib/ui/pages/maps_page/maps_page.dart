import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/maps_bloc/maps_bloc.dart';
import 'package:valorant_wiki_app/repositories/maps_repository/maps_repo.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/shimmer_widget.dart';

MapsRepo mapsRepo = MapsRepo();

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapsBloc>(
      create: (_) {
        final bloc = MapsBloc(mapsRepo);
        bloc.add(GetMapsEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Valorant",
          centerTitle: true,
          showBackButton: true,
        ),
        body: BlocBuilder<MapsBloc, MapsState>(
          builder: (context, state) {
            if (state is MapsLoadingState) {
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
            } else if (state is MapsLoadedState) {
              return ListView.builder(
                itemCount: state.mapList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Image.network(state.mapList[index].listViewIcon!),
                  );
                },
              );
            } else if (state is MapsErrorState) {
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
