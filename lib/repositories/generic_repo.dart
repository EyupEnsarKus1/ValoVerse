abstract class IGenericRepo<T> {
  Future<List<T>> getAllData();
  Future<T> getDataById(String id);
}

enum PageEnums {
  agents,
  weapons,
  competitivetiers,
  sprays,
  playercards,
  maps,
  buddies,
  settings
}
