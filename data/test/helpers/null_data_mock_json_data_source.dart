import 'package:domain/features/metrics/data_sources/json_data_source.dart';

class NullDataMockJsonDataSource implements JsonDataSource {
  @override
  Future<String> loadJson() async {
    const validJson = '''
      [
        {
          "id": null,
          "isActive": null,
          "price": null,
          "company": null,
          "picture": null,
          "buyer": null,
          "tags": null,
          "status": null,
          "registered": null
        }
      ]''';
    return validJson;
  }
}
