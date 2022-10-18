import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_class.freezed.dart';
part 'my_class.g.dart';

@Freezed()
class MyClass with _$MyClass {
  const factory MyClass({
    required int id,
    required String name,
    required double balance,
    @Default(true) bool isImportant,
  }) = _MyClass;
  factory MyClass.fromJson(Map<String, dynamic> json) =>
      _$MyClassFromJson(json);
}
