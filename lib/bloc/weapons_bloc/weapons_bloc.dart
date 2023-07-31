import 'package:bloc/bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/weapons_data.dart';
import 'package:valorant_wiki_app/repositories/weapons_repository/weapons_repository.dart';

part 'weapons_event.dart';
part 'weapons_state.dart';

class WeaponsBloc extends Bloc<WeaponsEvent, WeaponsState> {
  final WeaponsRepository repo;
  final LangCubit langCubit;
  WeaponsBloc(this.repo, this.langCubit) : super(WeaponsLoadingState()) {
    on<GetWeaponsEvent>(_onGetWeaponsEvent);
    on<GetWeaponsByIdEvent>(_onGetWeaponsByIdEvent);
  }

  _onGetWeaponsEvent(GetWeaponsEvent event, Emitter<WeaponsState> emit) async {
    try {
      emit(WeaponsLoadingState());
      final List<WeaponsData> weaponList =
          await repo.getAllData(langCubit.state.locale);
      for (var weapon in weaponList) {
        weapon.skins?.removeWhere((skin) => skin.displayIcon == null);
      }

      if (weaponList != null) {
        emit(WeaponsLoadedState(weaponList: weaponList));
      } else {
        WeaponsErrorState(errorMessage: 'weaponList is null');
      }
    } catch (e) {
      print(e.toString());
      emit(WeaponsErrorState(errorMessage: e.toString()));
    }
  }

  _onGetWeaponsByIdEvent(
      GetWeaponsByIdEvent event, Emitter<WeaponsState> emit) async {
    try {
      emit(WeaponsLoadingState());
      final WeaponsData weapon = await repo.getDataById(event.id);
      if (weapon != null) {
        emit(WeaponsLoadedState(weaponList: [weapon]));
      } else {
        WeaponsErrorState(errorMessage: 'weapon is null');
      }
    } catch (e) {
      emit(WeaponsErrorState(errorMessage: e.toString()));
    }
  }
}
