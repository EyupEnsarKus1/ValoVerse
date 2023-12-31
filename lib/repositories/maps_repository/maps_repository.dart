import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/maps_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

class MapsRepository implements IGenericRepo<MapData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<MapData>> getAllData(Locale locale) async {
    var languageCode = locale.countryCode == "TUR" ? "tr-TR" : "en-US";
    final ApiResponse<List<MapData>?> response =
        await apiService.get<List<MapData>>(
      "${PageEnums.maps.name}?language=$languageCode",
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
  Future<MapData> getDataById(String id) async {
    final ApiResponse<MapData?> response = await apiService.get<MapData>(
      '${PageEnums.maps.name}/$id',
      (data) => MapData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load map data');
    }
  }
}
