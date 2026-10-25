import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tabletalesweb/data/model/serializers.dart';

part 'built_table_row.g.dart';

abstract class BuiltTableRow
    implements Built<BuiltTableRow, BuiltTableRowBuilder> {
  int? get row_id;
  int? get math_id;
  String? get image_path;

  BuiltTableRow._();

  factory BuiltTableRow([updates(BuiltTableRowBuilder b)]) = _$BuiltTableRow;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltTableRow.serializer, this));
  }

  static BuiltTableRow? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltTableRow.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltTableRow> get serializer => _$builtTableRowSerializer;
}
