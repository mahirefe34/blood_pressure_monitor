import 'package:blood_pressure_monitor/feature/blood_pressure/model/blood_pressure_model.dart';
import 'package:flutter/material.dart';

import '../../../product/interfaces/i_cache_manager.dart';
import '../service/blood_pressure_manager.dart';
import '../view/add_bp_view.dart';

abstract class AddBPViewModel extends State<AddBPView> {
  late final ICacheManager<BloodPressureModel> cacheManager;
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cacheManager = BloodPressureCacheManager('db');
  }

  Future<void> createModelAndAddItem(
      {required String systolic,
      required String diastolic,
      required String pulse}) async {
    BloodPressureModel model = BloodPressureModel(
        systolic: systolic,
        diastolic: diastolic,
        pulse: pulse,
        time: DateTime.now());

    await cacheManager.addItem(model);
  }
}
