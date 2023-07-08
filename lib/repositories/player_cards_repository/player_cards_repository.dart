import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/player_cards_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

class PlayerCardsRepository implements IGenericRepo<PlayerCardData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<PlayerCardData>> getAllData() async {
    final ApiResponse<List<PlayerCardData>?> response = await apiService.get<List<PlayerCardData>>(
      DataTypes.playercards.name,
      (data) => (data['data'] as List).map((card) => PlayerCardData.fromJson(card as Map<String, dynamic>)).toList(),
    );
    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load player cards data');
    }
  }

  @override
  Future<PlayerCardData> getDataById(String id) async {
    final ApiResponse<PlayerCardData?> response = await apiService.get<PlayerCardData>(
      '${DataTypes.playercards.name}/$id',
      (data) => PlayerCardData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load player cards data');
    }
  }
}
