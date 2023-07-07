import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/models/maps_data.dart';
import 'package:valorant_wiki_app/repositories/maps_repository/generic_maps_repo.dart';

class MapsRepo implements GenericMapsRepository {
  final ApiService apiService =
      ApiService(baseUrl: "https://valorant-api.com/v1");

  @override
  Future<List<MapData>> getAllMaps() async {
    final ApiResponse<List<MapData>?> response =
        await apiService.get<List<MapData>>(
      'maps',
      (data) => (data['data'] as List)
          .map((map) => MapData.fromJson(map as Map<String, dynamic>))
          .toList(),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load maps data');
    }
  }

  @override
  Future<MapData> getMapById(String id) async {
    final ApiResponse<MapData?> response = await apiService.get<MapData>(
      'maps/$id',
      (data) => MapData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load map data');
    }
  }
}
