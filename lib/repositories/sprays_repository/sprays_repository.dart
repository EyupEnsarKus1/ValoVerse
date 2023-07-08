import 'package:valorant_wiki_app/core/api_service.dart';
import 'package:valorant_wiki_app/core/constants/app_constants.dart';
import 'package:valorant_wiki_app/models/sprays_data.dart';
import 'package:valorant_wiki_app/repositories/generic_repo.dart';

class SpraysRepository implements IGenericRepo<SprayData> {
  final ApiService apiService = ApiService(baseUrl: AppConstants.baseUrl);

  @override
  Future<List<SprayData>> getAllData() async {
    final ApiResponse<List<SprayData>?> response =
        await apiService.get<List<SprayData>>(
      Params.sprays.name,
      (data) => (data['data'] as List)
          .map((spray) => SprayData.fromJson(spray as Map<String, dynamic>))
          .toList(),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load sprays data');
    }
  }

  @override
  Future<SprayData> getDataById(String id) async {
    final ApiResponse<SprayData?> response = await apiService.get<SprayData>(
      '${Params.sprays.name}/$id',
      (data) => SprayData.fromJson(data as Map<String, dynamic>),
    );

    if (response.type == ResponseType.success && response.data != null) {
      return response.data!;
    } else {
      throw Exception('Failed to load sprays data');
    }
  }
}
