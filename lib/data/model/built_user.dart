import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tabletalesweb/data/model/serializers.dart';

part 'built_user.g.dart';

abstract class BuiltUser implements Built<BuiltUser, BuiltUserBuilder> {
  String? get user_id;

  String? get student_name;

  String? get parent_name;

  String? get mobile;

  String? get email;

  BuiltUser._();

  factory BuiltUser([updates(BuiltUserBuilder b)]) = _$BuiltUser;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltUser.serializer, this));
  }

  static BuiltUser? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltUser.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltUser> get serializer => _$builtUserSerializer;
}
