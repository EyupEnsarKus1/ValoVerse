import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/maps_bloc/maps_bloc.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/pages/maps_page/map_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../repo_implementation/repo_implementation.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapsBloc>(
      create: (_) {
        final bloc = MapsBloc(mapsRepo, LangCubit(context: context));
        bloc.add(GetMapsEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_maps.translate,
        ),
        body: BlocBuilder<MapsBloc, MapsState>(
          builder: (context, state) {
            if (state is MapsLoadingState) {
              return MapCard.shimmerWidget(context);
            } else if (state is MapsLoadedState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.mapList.length,
                itemBuilder: (context, index) {
                  return MapCard(
                    map: state.mapList[index],
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
