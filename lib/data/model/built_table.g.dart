// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_table.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltTable> _$builtTableSerializer = _$BuiltTableSerializer();

class _$BuiltTableSerializer implements StructuredSerializer<BuiltTable> {
  @override
  final Iterable<Type> types = const [BuiltTable, _$BuiltTable];
  @override
  final String wireName = 'BuiltTable';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltTable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.level_id;
    if (value != null) {
      result
        ..add('level_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.math_id;
    if (value != null) {
      result
        ..add('math_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.table_number;
    if (value != null) {
      result
        ..add('table_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuiltTable deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuiltTableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'level_id':
          result.level_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'math_id':
          result.math_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'table_number':
          result.table_number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltTable extends BuiltTable {
  @override
  final int? level_id;
  @override
  final int? math_id;
  @override
  final int? table_number;

  factory _$BuiltTable([void Function(BuiltTableBuilder)? updates]) =>
      (BuiltTableBuilder()..update(updates))._build();

  _$BuiltTable._({this.level_id, this.math_id, this.table_number}) : super._();
  @override
  BuiltTable rebuild(void Function(BuiltTableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltTableBuilder toBuilder() => BuiltTableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltTable &&
        level_id == other.level_id &&
        math_id == other.math_id &&
        table_number == other.table_number;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, level_id.hashCode);
    _$hash = $jc(_$hash, math_id.hashCode);
    _$hash = $jc(_$hash, table_number.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltTable')
          ..add('level_id', level_id)
          ..add('math_id', math_id)
          ..add('table_number', table_number))
        .toString();
  }
}

class BuiltTableBuilder implements Builder<BuiltTable, BuiltTableBuilder> {
  _$BuiltTable? _$v;

  int? _level_id;
  int? get level_id => _$this._level_id;
  set level_id(int? level_id) => _$this._level_id = level_id;

  int? _math_id;
  int? get math_id => _$this._math_id;
  set math_id(int? math_id) => _$this._math_id = math_id;

  int? _table_number;
  int? get table_number => _$this._table_number;
  set table_number(int? table_number) => _$this._table_number = table_number;

  BuiltTableBuilder();

  BuiltTableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _level_id = $v.level_id;
      _math_id = $v.math_id;
      _table_number = $v.table_number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltTable other) {
    _$v = other as _$BuiltTable;
  }

  @override
  void update(void Function(BuiltTableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltTable build() => _build();

  _$BuiltTable _build() {
    final _$result = _$v ??
        _$BuiltTable._(
          level_id: level_id,
          math_id: math_id,
          table_number: table_number,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
