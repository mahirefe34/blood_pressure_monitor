import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });
  test('Hive Test', () async {
    var box = await Hive.openBox<String>('mbe');

    await box.add('mahir');

    expect(box.values.first, 'mahir');
  });

  test('Theme Hive Test', () async {
    var themeBox = await Hive.openBox<bool>('theme');

    await themeBox.put('theme', true);

    expect(themeBox.get('theme'), true);
  });

  test('List Hive Test', () async {
    var listBox = await Hive.openBox<String>('mbe');
    await listBox.clear();

    List<String> items = List.generate(100, (index) => '$index');

    await listBox.addAll(items);

    expect(listBox.values.first, '0');
  });

  test('Model Hive Test', () async {
    var mapBox = await Hive.openBox<String>('demos');

    List<MapEntry<String, String>> items = List.generate(
        100, (index) => MapEntry('$index - $index', 'mbe $index'));

    await mapBox.putAll(Map.fromEntries(items));

    expect(mapBox.get('99 - 99'), 'mbe 99');
  });
}

class DemoModel {
  final int? id;
  final String? name;

  DemoModel(this.id, this.name);
}
