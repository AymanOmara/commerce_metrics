import 'package:data/features/metrics/models/metrics_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("json serialization", () {
    test('test serializing json with missing fields', () {
      var jsonResponse = {
        "id": "617ec8334918126e024c3468",
        "isActive": false,
        "price": "\$3,973.45",
        "company": "FUTURIZE",
        // Missing some fields like picture, buyer, etc.
      };

      var serializedData = MetricsModel.fromJson(jsonResponse);
      expect(serializedData, isNotNull);
      expect(serializedData.id, "617ec8334918126e024c3468");
      expect(serializedData.isActive, false);
      expect(serializedData.price, "\$3,973.45");
      expect(serializedData.company, "FUTURIZE");
      expect(serializedData.picture, null);
      expect(serializedData.buyer, null);
      expect(serializedData.tags, []);
      expect(serializedData.orderStatus,
          null);
      expect(serializedData.registered, null);
    });
    test('test serializing json in metrics', () {
      var jsonResponse = {
        "id": "617ec8334918126e024c3468",
        "isActive": false,
        "price": "\$3,973.45",
        "company": "FUTURIZE",
        "picture": "http://placehold.it/32x32",
        "buyer": "Brandie Best",
        "tags": [
          "#non",
          "#tempor",
          "#qui",
          "#enim",
          "#laborum",
          "#irure",
          "#ipsum"
        ],
        "status": "DELIVERED",
        "registered": "2021-09-07T12:40:47 -02:00"
      };
      var serializedData = MetricsModel.fromJson(jsonResponse);
      expect(serializedData, isNotNull);
      expect(serializedData.id, "617ec8334918126e024c3468");
      expect(serializedData.isActive, false);
      expect(serializedData.price, "\$3,973.45");
      expect(serializedData.company, "FUTURIZE");
      expect(serializedData.picture, "http://placehold.it/32x32");
      expect(serializedData.buyer, "Brandie Best");
      expect(serializedData.tags,
          ["#non", "#tempor", "#qui", "#enim", "#laborum", "#irure", "#ipsum"]);
      expect(serializedData.orderStatus, "DELIVERED");
      expect(serializedData.registered, "2021-09-07T12:40:47 -02:00");
    });
  });
}
