import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/sprays_data.dart';
import 'package:valorant_wiki_app/repositories/sprays_repository/sprays_repository.dart';

part 'spray_event.dart';
part 'spray_state.dart';

class SprayBloc extends Bloc<SprayEvent, SprayState> {
  final SpraysRepository repo;
  final LangCubit langCubit;
  SprayBloc(this.repo, this.langCubit) : super(SprayLoadingState()) {
    on<GetSpraysEvent>(_onGetSpraysEvent);
    on<GetSpraysByIdEvent>(_onGetSpraysByIdEvent);
  }

  _onGetSpraysEvent(GetSpraysEvent event, Emitter<SprayState> emit) async {
    try {
      emit(SprayLoadingState());
      final List<SprayData> sprayList =
          await repo.getAllData(langCubit.state.locale);
      if (sprayList != null) {
        emit(SprayLoadedState(sprayList: sprayList));
      } else {
        emit(SprayErrorState(errorMessage: 'sprays is null'));
      }
    } catch (e) {
      emit(SprayErrorState(errorMessage: e.toString()));
    }
  }

  _onGetSpraysByIdEvent(
      GetSpraysByIdEvent event, Emitter<SprayState> emit) async {
    try {
      emit(SprayLoadingState());
      final SprayData sprayList = await repo.getDataById(event.id);
      if (sprayList != null) {
        emit(SprayLoadedState(sprayList: [sprayList]));
      } else {
        emit(SprayErrorState(errorMessage: 'spray is null'));
      }
    } catch (e) {
      emit(SprayErrorState(errorMessage: e.toString()));
    }
  }
}
