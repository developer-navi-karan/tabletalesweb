import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tabletalesweb/data/model/serializers.dart';

part 'built_quiz.g.dart';

abstract class BuiltQuiz implements Built<BuiltQuiz, BuiltQuizBuilder> {
  int? get question_id;
  int? get quiz_id;
  String? get question_type;
  String? get question_text;
  String? get option_a;
  String? get option_b;
  String? get option_c;
  String? get option_d;
  String? get correct_option;
  String? get correct_answer;

  BuiltQuiz._();

  factory BuiltQuiz([updates(BuiltQuizBuilder b)]) = _$BuiltQuiz;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltQuiz.serializer, this));
  }

  static BuiltQuiz? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltQuiz.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltQuiz> get serializer => _$builtQuizSerializer;
}
