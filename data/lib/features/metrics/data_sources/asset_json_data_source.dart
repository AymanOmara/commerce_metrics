import 'package:domain/features/metrics/data_sources/json_data_source.dart';
import 'package:flutter/services.dart';

class AssetJsonDataSource implements JsonDataSource {
  @override
  Future<String> loadJson() async {
    return await rootBundle.loadString('packages/data/assets/orders.json');
  }
}
