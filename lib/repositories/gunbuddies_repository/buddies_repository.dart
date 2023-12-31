import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/gun_buddies_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

class BuddiesRepository implements IGenericRepo<BuddyData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<BuddyData>> getAllData(Locale locale) async {
    var languageCode = locale.countryCode == "TUR" ? "tr-TR" : "en-US";
    final ApiResponse<List<BuddyData>?> response =
        await apiService.get<List<BuddyData>>(
      "${PageEnums.buddies.name}?language=$languageCode",
      (data) => (data['data'] as List)
          .map((buddy) => BuddyData.fromJson(buddy as Map<String, dynamic>))
          .toList(),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load buddy data');
    }
  }

  @override
  Future<BuddyData> getDataById(String id) async {
    final ApiResponse<BuddyData?> response = await apiService.get<BuddyData>(
      '${PageEnums.buddies.name}/$id',
      (data) => BuddyData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load buddy data');
    }
  }
}
