import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/constant/hive_constant.dart';

import 'package:equatable/equatable.dart';

part 'blood_pressure_model.g.dart';

@HiveType(typeId: HiveConstant.bloodPressureId)
class BloodPressureModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  String? systolic;
  @HiveField(1)
  String? diastolic;
  @HiveField(2)
  String? pulse;
  @HiveField(3)
  DateTime? time;

  BloodPressureModel({
    this.systolic,
    this.diastolic,
    this.pulse,
    this.time,
  });

  @override
  List<Object?> get props => [systolic, diastolic, pulse, time];

  BloodPressureModel copyWith({
    String? systolic,
    String? diastolic,
    String? pulse,
    DateTime? time,
  }) {
    return BloodPressureModel(
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      pulse: pulse ?? this.pulse,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse,
      'time': time,
    };
  }

  factory BloodPressureModel.fromJson(Map<String, dynamic> json) {
    return BloodPressureModel(
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      pulse: json['pulse'] as String?,
      time: json['time'] as DateTime?,
    );
  }
}
