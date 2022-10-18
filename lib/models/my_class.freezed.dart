// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyClass _$MyClassFromJson(Map<String, dynamic> json) {
  return _MyClass.fromJson(json);
}

/// @nodoc
mixin _$MyClass {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  bool get isImportant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyClassCopyWith<MyClass> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyClassCopyWith<$Res> {
  factory $MyClassCopyWith(MyClass value, $Res Function(MyClass) then) =
      _$MyClassCopyWithImpl<$Res>;
  $Res call({int id, String name, double balance, bool isImportant});
}

/// @nodoc
class _$MyClassCopyWithImpl<$Res> implements $MyClassCopyWith<$Res> {
  _$MyClassCopyWithImpl(this._value, this._then);

  final MyClass _value;
  // ignore: unused_field
  final $Res Function(MyClass) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? balance = freezed,
    Object? isImportant = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isImportant: isImportant == freezed
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MyClassCopyWith<$Res> implements $MyClassCopyWith<$Res> {
  factory _$$_MyClassCopyWith(
          _$_MyClass value, $Res Function(_$_MyClass) then) =
      __$$_MyClassCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, double balance, bool isImportant});
}

/// @nodoc
class __$$_MyClassCopyWithImpl<$Res> extends _$MyClassCopyWithImpl<$Res>
    implements _$$_MyClassCopyWith<$Res> {
  __$$_MyClassCopyWithImpl(_$_MyClass _value, $Res Function(_$_MyClass) _then)
      : super(_value, (v) => _then(v as _$_MyClass));

  @override
  _$_MyClass get _value => super._value as _$_MyClass;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? balance = freezed,
    Object? isImportant = freezed,
  }) {
    return _then(_$_MyClass(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isImportant: isImportant == freezed
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyClass implements _MyClass {
  const _$_MyClass(
      {required this.id,
      required this.name,
      required this.balance,
      this.isImportant = true});

  factory _$_MyClass.fromJson(Map<String, dynamic> json) =>
      _$$_MyClassFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double balance;
  @override
  @JsonKey()
  final bool isImportant;

  @override
  String toString() {
    return 'MyClass(id: $id, name: $name, balance: $balance, isImportant: $isImportant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyClass &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.isImportant, isImportant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(isImportant));

  @JsonKey(ignore: true)
  @override
  _$$_MyClassCopyWith<_$_MyClass> get copyWith =>
      __$$_MyClassCopyWithImpl<_$_MyClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyClassToJson(
      this,
    );
  }
}

abstract class _MyClass implements MyClass {
  const factory _MyClass(
      {required final int id,
      required final String name,
      required final double balance,
      final bool isImportant}) = _$_MyClass;

  factory _MyClass.fromJson(Map<String, dynamic> json) = _$_MyClass.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get balance;
  @override
  bool get isImportant;
  @override
  @JsonKey(ignore: true)
  _$$_MyClassCopyWith<_$_MyClass> get copyWith =>
      throw _privateConstructorUsedError;
}
