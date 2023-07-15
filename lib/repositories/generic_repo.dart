abstract class IGenericRepo<T> {
  Future<List<T>> getAllData();
  Future<T> getDataById(String id);
}

enum DataTypes { agents, weapons, competitivetiers, sprays, playercards, maps, buddies }