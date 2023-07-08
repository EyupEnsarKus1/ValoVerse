import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/weapons_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

class WeaponsRepository implements IGenericRepo<WeaponsData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<WeaponsData>> getAllData() async {
    final ApiResponse<List<WeaponsData>?> response =
        await apiService.get<List<WeaponsData>>(
      Params.weapons.name,
      (data) => (data['data'] as List)
          .map((weapon) => WeaponsData.fromJson(weapon as Map<String, dynamic>))
          .toList(),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load weapons data');
    }
  }

  @override
  Future<WeaponsData> getDataById(String id) async {
    final ApiResponse<WeaponsData?> response =
        await apiService.get<WeaponsData>(
      '${Params.weapons.name}/$id',
      (data) => WeaponsData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load weapon data');
    }
  }
}
