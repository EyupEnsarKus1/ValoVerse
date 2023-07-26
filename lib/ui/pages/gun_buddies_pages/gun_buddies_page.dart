import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/gunbuddies_bloc/gunbuddies_bloc.dart';
import 'package:valorant_wiki_app/repositories/gunbuddies_repository/buddies_repository.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/pages/gun_buddies_pages/gun_buddie_card.dart';

import '../../../core/locale_keys.g.dart';
import '../../constants/styles/fonts.dart';
import '../../custom_widgets/custom_appBar.dart';
import '../../custom_widgets/shimmer_widget.dart';

BuddiesRepository repo = BuddiesRepository();

class GunBuddiesPage extends StatelessWidget {
  const GunBuddiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GunbuddiesBloc>(
      create: (_) {
        final bloc = GunbuddiesBloc(repo);
        bloc.add(GetGunBudiesEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_gunBuddies.translate,
        ),
        body: BlocBuilder<GunbuddiesBloc, GunbuddiesState>(
          builder: (context, state) {
            if (state is GunbuddiesLoadingState) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                itemCount: 10,
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
            } else if (state is GunbuddiesLoadedState) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: AppSizes.size8,
                  crossAxisSpacing: AppSizes.size8,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size16,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.gunBuddiesList.length,
                itemBuilder: (context, index) {
                  return GunBuddieCard(
                    buddie: state.gunBuddiesList[index],
                  );
                },
              );
            } else if (state is GunbuddiesErrorState) {
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
