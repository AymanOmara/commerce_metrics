import 'package:domain/features/metrics/data_sources/json_data_source.dart';

class SuccessMockJsonDataSource implements JsonDataSource {
  @override
  Future<String> loadJson() async {
    const validJson = '''
      [
        {
          "id": "617ec8334918126e024c3468",
          "isActive": false,
          "price": "\$3,973.45",
          "company": "FUTURIZE",
          "picture": "http://placehold.it/32x32",
          "buyer": "Brandie Best",
          "tags": ["#non", "#tempor"],
          "status": "DELIVERED",
          "registered": "2021-09-07T12:40:47 -02:00"
        }
      ]''';
    return validJson;
  }
}
