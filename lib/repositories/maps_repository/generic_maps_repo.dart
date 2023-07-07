import 'package:valorant_wiki_app/models/maps_data.dart';

abstract class GenericMapsRepository {
  Future<List<MapData>> getAllMaps();
  Future<MapData> getMapById(String id);
}
