import 'package:bloc/bloc.dart';
import 'package:valorant_wiki_app/models/gun_buddies_data.dart';
import 'package:valorant_wiki_app/repositories/gunbuddies_repository/buddies_repository.dart';

part 'gunbuddies_event.dart';
part 'gunbuddies_state.dart';

class GunbuddiesBloc extends Bloc<GunbuddiesEvent, GunbuddiesState> {
  final BuddiesRepository buddiesRepo;
  GunbuddiesBloc(this.buddiesRepo) : super(GunbuddiesLoadingState()) {
    on<GetGunBudiesEvent>(_onGetGunBuddiesEvent);
    on<GetGunBudiesByIdEvent>(_onGetGunBuddiesByIdEvent);
  }

  _onGetGunBuddiesEvent(
      GetGunBudiesEvent event, Emitter<GunbuddiesState> emit) async {
    try {
      emit(GunbuddiesLoadingState());
      final List<BuddyData> gunBuddiesList = await buddiesRepo.getAllData();
      if (gunBuddiesList != null) {
        emit(GunbuddiesLoadedState(gunBuddiesList: gunBuddiesList));
      } else {
        emit(GunbuddiesErrorState(errorMessage: 'gunbudies list is null'));
      }
    } catch (e) {
      emit(GunbuddiesErrorState(errorMessage: e.toString()));
    }
  }

  _onGetGunBuddiesByIdEvent(
      GetGunBudiesByIdEvent event, Emitter<GunbuddiesState> emit) async {
    try {
      final BuddyData gunBuddie = await buddiesRepo.getDataById(event.id);
      if (gunBuddie != null) {
        emit(GunbuddiesLoadedState(gunBuddiesList: [gunBuddie]));
      } else {
        emit(GunbuddiesErrorState(errorMessage: 'gunbuddie is null'));
      }
    } catch (e) {
      emit(GunbuddiesErrorState(errorMessage: e.toString()));
    }
  }
}
