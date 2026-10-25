// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_quiz.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltQuiz> _$builtQuizSerializer = _$BuiltQuizSerializer();

class _$BuiltQuizSerializer implements StructuredSerializer<BuiltQuiz> {
  @override
  final Iterable<Type> types = const [BuiltQuiz, _$BuiltQuiz];
  @override
  final String wireName = 'BuiltQuiz';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltQuiz object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.question_id;
    if (value != null) {
      result
        ..add('question_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quiz_id;
    if (value != null) {
      result
        ..add('quiz_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.question_type;
    if (value != null) {
      result
        ..add('question_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.question_text;
    if (value != null) {
      result
        ..add('question_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.option_a;
    if (value != null) {
      result
        ..add('option_a')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.option_b;
    if (value != null) {
      result
        ..add('option_b')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.option_c;
    if (value != null) {
      result
        ..add('option_c')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.option_d;
    if (value != null) {
      result
        ..add('option_d')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.correct_option;
    if (value != null) {
      result
        ..add('correct_option')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.correct_answer;
    if (value != null) {
      result
        ..add('correct_answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltQuiz deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuiltQuizBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'question_id':
          result.question_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'quiz_id':
          result.quiz_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'question_type':
          result.question_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'question_text':
          result.question_text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'option_a':
          result.option_a = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'option_b':
          result.option_b = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'option_c':
          result.option_c = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'option_d':
          result.option_d = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'correct_option':
          result.correct_option = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'correct_answer':
          result.correct_answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltQuiz extends BuiltQuiz {
  @override
  final int? question_id;
  @override
  final int? quiz_id;
  @override
  final String? question_type;
  @override
  final String? question_text;
  @override
  final String? option_a;
  @override
  final String? option_b;
  @override
  final String? option_c;
  @override
  final String? option_d;
  @override
  final String? correct_option;
  @override
  final String? correct_answer;

  factory _$BuiltQuiz([void Function(BuiltQuizBuilder)? updates]) =>
      (BuiltQuizBuilder()..update(updates))._build();

  _$BuiltQuiz._(
      {this.question_id,
      this.quiz_id,
      this.question_type,
      this.question_text,
      this.option_a,
      this.option_b,
      this.option_c,
      this.option_d,
      this.correct_option,
      this.correct_answer})
      : super._();
  @override
  BuiltQuiz rebuild(void Function(BuiltQuizBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltQuizBuilder toBuilder() => BuiltQuizBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltQuiz &&
        question_id == other.question_id &&
        quiz_id == other.quiz_id &&
        question_type == other.question_type &&
        question_text == other.question_text &&
        option_a == other.option_a &&
        option_b == other.option_b &&
        option_c == other.option_c &&
        option_d == other.option_d &&
        correct_option == other.correct_option &&
        correct_answer == other.correct_answer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, question_id.hashCode);
    _$hash = $jc(_$hash, quiz_id.hashCode);
    _$hash = $jc(_$hash, question_type.hashCode);
    _$hash = $jc(_$hash, question_text.hashCode);
    _$hash = $jc(_$hash, option_a.hashCode);
    _$hash = $jc(_$hash, option_b.hashCode);
    _$hash = $jc(_$hash, option_c.hashCode);
    _$hash = $jc(_$hash, option_d.hashCode);
    _$hash = $jc(_$hash, correct_option.hashCode);
    _$hash = $jc(_$hash, correct_answer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltQuiz')
          ..add('question_id', question_id)
          ..add('quiz_id', quiz_id)
          ..add('question_type', question_type)
          ..add('question_text', question_text)
          ..add('option_a', option_a)
          ..add('option_b', option_b)
          ..add('option_c', option_c)
          ..add('option_d', option_d)
          ..add('correct_option', correct_option)
          ..add('correct_answer', correct_answer))
        .toString();
  }
}

class BuiltQuizBuilder implements Builder<BuiltQuiz, BuiltQuizBuilder> {
  _$BuiltQuiz? _$v;

  int? _question_id;
  int? get question_id => _$this._question_id;
  set question_id(int? question_id) => _$this._question_id = question_id;

  int? _quiz_id;
  int? get quiz_id => _$this._quiz_id;
  set quiz_id(int? quiz_id) => _$this._quiz_id = quiz_id;

  String? _question_type;
  String? get question_type => _$this._question_type;
  set question_type(String? question_type) =>
      _$this._question_type = question_type;

  String? _question_text;
  String? get question_text => _$this._question_text;
  set question_text(String? question_text) =>
      _$this._question_text = question_text;

  String? _option_a;
  String? get option_a => _$this._option_a;
  set option_a(String? option_a) => _$this._option_a = option_a;

  String? _option_b;
  String? get option_b => _$this._option_b;
  set option_b(String? option_b) => _$this._option_b = option_b;

  String? _option_c;
  String? get option_c => _$this._option_c;
  set option_c(String? option_c) => _$this._option_c = option_c;

  String? _option_d;
  String? get option_d => _$this._option_d;
  set option_d(String? option_d) => _$this._option_d = option_d;

  String? _correct_option;
  String? get correct_option => _$this._correct_option;
  set correct_option(String? correct_option) =>
      _$this._correct_option = correct_option;

  String? _correct_answer;
  String? get correct_answer => _$this._correct_answer;
  set correct_answer(String? correct_answer) =>
      _$this._correct_answer = correct_answer;

  BuiltQuizBuilder();

  BuiltQuizBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _question_id = $v.question_id;
      _quiz_id = $v.quiz_id;
      _question_type = $v.question_type;
      _question_text = $v.question_text;
      _option_a = $v.option_a;
      _option_b = $v.option_b;
      _option_c = $v.option_c;
      _option_d = $v.option_d;
      _correct_option = $v.correct_option;
      _correct_answer = $v.correct_answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltQuiz other) {
    _$v = other as _$BuiltQuiz;
  }

  @override
  void update(void Function(BuiltQuizBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltQuiz build() => _build();

  _$BuiltQuiz _build() {
    final _$result = _$v ??
        _$BuiltQuiz._(
          question_id: question_id,
          quiz_id: quiz_id,
          question_type: question_type,
          question_text: question_text,
          option_a: option_a,
          option_b: option_b,
          option_c: option_c,
          option_d: option_d,
          correct_option: correct_option,
          correct_answer: correct_answer,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
