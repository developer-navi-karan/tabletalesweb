import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tabletalesweb/data/model/serializers.dart';

part 'built_country.g.dart';

abstract class BuiltCountry
    implements Built<BuiltCountry, BuiltCountryBuilder> {
  String get name;
  String get dial_code;
  String get code;

  BuiltCountry._();

  factory BuiltCountry([updates(BuiltCountryBuilder b)]) = _$BuiltCountry;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltCountry.serializer, this));
  }

  static BuiltCountry? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltCountry.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltCountry> get serializer => _$builtCountrySerializer;

  @override
  String toString() {
    super.toString();
    return dial_code;
  }
}
