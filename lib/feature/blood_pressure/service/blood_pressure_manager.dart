import 'package:blood_pressure_monitor/feature/blood_pressure/model/blood_pressure_model.dart';
import 'package:blood_pressure_monitor/product/interfaces/i_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/constant/hive_constant.dart';

class BloodPressureCacheManager extends ICacheManager<BloodPressureModel> {
  BloodPressureCacheManager(super.key);

  @override
  Future<void> addItem(BloodPressureModel item) async {
    await box?.add(item);
  }

  @override
  Future<void> addItems(List<BloodPressureModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<BloodPressureModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.time, e))));
  }

  @override
  BloodPressureModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  List<BloodPressureModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> putItem(String key, BloodPressureModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  void registerAdapters() {
    if (!(Hive.isAdapterRegistered(HiveConstant.bloodPressureId))) {
      Hive.registerAdapter(BloodPressureModelAdapter());
    }
  }
}
