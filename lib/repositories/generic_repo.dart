import 'package:flutter/material.dart';

abstract class IGenericRepo<T> {
  Future<List<T>> getAllData(Locale locale);
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
