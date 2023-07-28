import 'package:bloc/bloc.dart';
import 'package:valorant_wiki_app/bloc/lang_cubit/lang_cubit.dart';
import 'package:valorant_wiki_app/models/maps_data.dart';
import 'package:valorant_wiki_app/repositories/maps_repository/maps_repository.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapsRepository mapsRepo;
  final LangCubit langCubit;
  MapsBloc(this.mapsRepo, this.langCubit) : super(MapsLoadingState()) {
    on<GetMapsEvent>(_onGetMapsEvent);
    on<GetMapByIdEvent>(_onGetMapsById);
  }

  _onGetMapsEvent(GetMapsEvent event, Emitter<MapsState> emit) async {
    try {
      emit(MapsLoadingState());
      final List<MapData> mapList =
          await mapsRepo.getAllData(langCubit.state.locale);
      if (mapList == null) {
        emit(MapsErrorState(errorMessage: 'Map list is null'));
      } else {
        emit(MapsLoadedState(mapList: mapList));
      }
    } catch (e) {
      emit(MapsErrorState(errorMessage: e.toString()));
    }
  }

  _onGetMapsById(GetMapByIdEvent event, Emitter<MapsState> emit) async {
    try {
      emit(MapsLoadingState());
      final MapData mapData = await mapsRepo.getDataById(event.id);
      if (mapData == null) {
        emit(MapsErrorState(errorMessage: 'Map Data is null'));
      } else {
        emit(MapsLoadedState(mapList: [mapData]));
      }
    } catch (e) {
      emit(MapsErrorState(errorMessage: e.toString()));
    }
  }
}
