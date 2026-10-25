// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltUser> _$builtUserSerializer = _$BuiltUserSerializer();

class _$BuiltUserSerializer implements StructuredSerializer<BuiltUser> {
  @override
  final Iterable<Type> types = const [BuiltUser, _$BuiltUser];
  @override
  final String wireName = 'BuiltUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user_id;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.student_name;
    if (value != null) {
      result
        ..add('student_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parent_name;
    if (value != null) {
      result
        ..add('parent_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobile;
    if (value != null) {
      result
        ..add('mobile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuiltUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'student_name':
          result.student_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parent_name':
          result.parent_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobile':
          result.mobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltUser extends BuiltUser {
  @override
  final String? user_id;
  @override
  final String? student_name;
  @override
  final String? parent_name;
  @override
  final String? mobile;
  @override
  final String? email;

  factory _$BuiltUser([void Function(BuiltUserBuilder)? updates]) =>
      (BuiltUserBuilder()..update(updates))._build();

  _$BuiltUser._(
      {this.user_id,
      this.student_name,
      this.parent_name,
      this.mobile,
      this.email})
      : super._();
  @override
  BuiltUser rebuild(void Function(BuiltUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltUserBuilder toBuilder() => BuiltUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltUser &&
        user_id == other.user_id &&
        student_name == other.student_name &&
        parent_name == other.parent_name &&
        mobile == other.mobile &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, student_name.hashCode);
    _$hash = $jc(_$hash, parent_name.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltUser')
          ..add('user_id', user_id)
          ..add('student_name', student_name)
          ..add('parent_name', parent_name)
          ..add('mobile', mobile)
          ..add('email', email))
        .toString();
  }
}

class BuiltUserBuilder implements Builder<BuiltUser, BuiltUserBuilder> {
  _$BuiltUser? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  String? _student_name;
  String? get student_name => _$this._student_name;
  set student_name(String? student_name) => _$this._student_name = student_name;

  String? _parent_name;
  String? get parent_name => _$this._parent_name;
  set parent_name(String? parent_name) => _$this._parent_name = parent_name;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  BuiltUserBuilder();

  BuiltUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _student_name = $v.student_name;
      _parent_name = $v.parent_name;
      _mobile = $v.mobile;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltUser other) {
    _$v = other as _$BuiltUser;
  }

  @override
  void update(void Function(BuiltUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltUser build() => _build();

  _$BuiltUser _build() {
    final _$result = _$v ??
        _$BuiltUser._(
          user_id: user_id,
          student_name: student_name,
          parent_name: parent_name,
          mobile: mobile,
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
