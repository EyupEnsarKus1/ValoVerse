import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/bloc/spray_bloc/spray_bloc.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_appBar.dart';
import 'package:valorant_wiki_app/ui/custom_widgets/custom_gridView.dart';
import 'package:valorant_wiki_app/ui/pages/spray_pages/spray_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../repo_implementation/repo_implementation.dart';

class SpraysPage extends StatelessWidget {
  const SpraysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SprayBloc>(
      create: (_) {
        final bloc = SprayBloc(sprayRepo, LangCubit(context: context));
        bloc.add(GetSpraysEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_sprays.translate,
        ),
        body: BlocBuilder<SprayBloc, SprayState>(
          builder: (context, state) {
            if (state is SprayLoadingState) {
              return SprayCard.shimmerWidget(context);
            } else if (state is SprayLoadedState) {
              return CustomGridView(
                crossAxisCount: 2,
                aspectRatio: 0.7,
                mainSpacing: AppSizes.size8,
                crossSpacing: AppSizes.size8,
                verticalAxis: true,
                itemCount: state.sprayList.length,
                itemBuilder: (context, index) {
                  return SprayCard(
                    spray: state.sprayList[index],
                  );
                },
              );
            } else if (state is SprayErrorState) {
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
