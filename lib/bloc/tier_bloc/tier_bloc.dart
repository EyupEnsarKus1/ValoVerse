import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/competitive_tier_data.dart';
import 'package:valorant_wiki_app/repositories/competitive_tier_repository/competitive_tier_repository.dart';

part 'tier_event.dart';
part 'tier_state.dart';

class TierBloc extends Bloc<TierEvent, TierState> {
  final CompetitiveTierRepository repo;
  final LangCubit langCubit;
  TierBloc(this.repo, this.langCubit) : super(TierLoadingState()) {
    on<GetTierEvent>(_onGetTierEvent);
    on<GetTierByIdEvent>(_onGetTierByIdEvent);
  }

  _onGetTierEvent(GetTierEvent event, Emitter<TierState> emit) async {
    try {
      emit(TierLoadingState());
      final List<CompetitiveTierData> tierList =
          await repo.getAllData(langCubit.state.locale);
      if (tierList != null) {
        emit(TierLoadedState(tierList: tierList));
      } else {
        emit(TierErrorState(errorMessage: 'tierlist is null'));
      }
    } catch (e) {
      emit(TierErrorState(errorMessage: e.toString()));
    }
  }

  _onGetTierByIdEvent(GetTierByIdEvent event, Emitter<TierState> emit) async {
    try {
      emit(TierLoadingState());
      final CompetitiveTierData tier = await repo.getDataById(event.id);
      if (tier != null) {
        emit(TierLoadedState(tierList: [tier]));
      } else {
        emit(TierErrorState(errorMessage: 'tier is null'));
      }
    } catch (e) {
      emit(TierErrorState(errorMessage: e.toString()));
    }
  }
}
