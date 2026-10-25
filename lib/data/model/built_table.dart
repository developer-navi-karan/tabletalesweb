import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tabletalesweb/data/model/serializers.dart';

part 'built_table.g.dart';

abstract class BuiltTable implements Built<BuiltTable, BuiltTableBuilder> {
  int? get level_id;
  int? get math_id;
  int? get table_number;

  BuiltTable._();

  factory BuiltTable([updates(BuiltTableBuilder b)]) = _$BuiltTable;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltTable.serializer, this));
  }

  static BuiltTable? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltTable.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltTable> get serializer => _$builtTableSerializer;
}
