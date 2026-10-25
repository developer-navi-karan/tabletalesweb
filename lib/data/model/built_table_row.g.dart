// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_table_row.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltTableRow> _$builtTableRowSerializer =
    _$BuiltTableRowSerializer();

class _$BuiltTableRowSerializer implements StructuredSerializer<BuiltTableRow> {
  @override
  final Iterable<Type> types = const [BuiltTableRow, _$BuiltTableRow];
  @override
  final String wireName = 'BuiltTableRow';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltTableRow object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.row_id;
    if (value != null) {
      result
        ..add('row_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.math_id;
    if (value != null) {
      result
        ..add('math_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image_path;
    if (value != null) {
      result
        ..add('image_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltTableRow deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuiltTableRowBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'row_id':
          result.row_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'math_id':
          result.math_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image_path':
          result.image_path = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltTableRow extends BuiltTableRow {
  @override
  final int? row_id;
  @override
  final int? math_id;
  @override
  final String? image_path;

  factory _$BuiltTableRow([void Function(BuiltTableRowBuilder)? updates]) =>
      (BuiltTableRowBuilder()..update(updates))._build();

  _$BuiltTableRow._({this.row_id, this.math_id, this.image_path}) : super._();
  @override
  BuiltTableRow rebuild(void Function(BuiltTableRowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltTableRowBuilder toBuilder() => BuiltTableRowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltTableRow &&
        row_id == other.row_id &&
        math_id == other.math_id &&
        image_path == other.image_path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, row_id.hashCode);
    _$hash = $jc(_$hash, math_id.hashCode);
    _$hash = $jc(_$hash, image_path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltTableRow')
          ..add('row_id', row_id)
          ..add('math_id', math_id)
          ..add('image_path', image_path))
        .toString();
  }
}

class BuiltTableRowBuilder
    implements Builder<BuiltTableRow, BuiltTableRowBuilder> {
  _$BuiltTableRow? _$v;

  int? _row_id;
  int? get row_id => _$this._row_id;
  set row_id(int? row_id) => _$this._row_id = row_id;

  int? _math_id;
  int? get math_id => _$this._math_id;
  set math_id(int? math_id) => _$this._math_id = math_id;

  String? _image_path;
  String? get image_path => _$this._image_path;
  set image_path(String? image_path) => _$this._image_path = image_path;

  BuiltTableRowBuilder();

  BuiltTableRowBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _row_id = $v.row_id;
      _math_id = $v.math_id;
      _image_path = $v.image_path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltTableRow other) {
    _$v = other as _$BuiltTableRow;
  }

  @override
  void update(void Function(BuiltTableRowBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltTableRow build() => _build();

  _$BuiltTableRow _build() {
    final _$result = _$v ??
        _$BuiltTableRow._(
          row_id: row_id,
          math_id: math_id,
          image_path: image_path,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
