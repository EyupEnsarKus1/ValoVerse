abstract class IGenericRepo<T> {
  Future<List<T>> getAllData();
  Future<T> getDataById(String id);
}

enum Params {
  agents,
  maps,
  weapons,
  sprays,
  playercards,
  competitivetiers,
  buddies
}
