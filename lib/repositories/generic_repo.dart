abstract class IGenericRepo<T> {
  Future<List<T>> getAllData();
  Future<T> getDataById(String id);
}

enum Params {
  agents,
  weapons,
  competitivetiers,
  sprays,
  playercards,
  maps,
  buddies
}
