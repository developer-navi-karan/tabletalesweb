import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_failure.freezed.dart';

@freezed
abstract class TableFailure with _$TableFailure {
  const factory TableFailure.serverError(String msg) = ServerError;
}
