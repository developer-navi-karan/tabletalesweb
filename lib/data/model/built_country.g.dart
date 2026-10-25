// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_country.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltCountry> _$builtCountrySerializer = _$BuiltCountrySerializer();

class _$BuiltCountrySerializer implements StructuredSerializer<BuiltCountry> {
  @override
  final Iterable<Type> types = const [BuiltCountry, _$BuiltCountry];
  @override
  final String wireName = 'BuiltCountry';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltCountry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'dial_code',
      serializers.serialize(object.dial_code,
          specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltCountry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuiltCountryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dial_code':
          result.dial_code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltCountry extends BuiltCountry {
  @override
  final String name;
  @override
  final String dial_code;
  @override
  final String code;

  factory _$BuiltCountry([void Function(BuiltCountryBuilder)? updates]) =>
      (BuiltCountryBuilder()..update(updates))._build();

  _$BuiltCountry._(
      {required this.name, required this.dial_code, required this.code})
      : super._();
  @override
  BuiltCountry rebuild(void Function(BuiltCountryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltCountryBuilder toBuilder() => BuiltCountryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltCountry &&
        name == other.name &&
        dial_code == other.dial_code &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, dial_code.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class BuiltCountryBuilder
    implements Builder<BuiltCountry, BuiltCountryBuilder> {
  _$BuiltCountry? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _dial_code;
  String? get dial_code => _$this._dial_code;
  set dial_code(String? dial_code) => _$this._dial_code = dial_code;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  BuiltCountryBuilder();

  BuiltCountryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dial_code = $v.dial_code;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltCountry other) {
    _$v = other as _$BuiltCountry;
  }

  @override
  void update(void Function(BuiltCountryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltCountry build() => _build();

  _$BuiltCountry _build() {
    final _$result = _$v ??
        _$BuiltCountry._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'BuiltCountry', 'name'),
          dial_code: BuiltValueNullFieldError.checkNotNull(
              dial_code, r'BuiltCountry', 'dial_code'),
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'BuiltCountry', 'code'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
