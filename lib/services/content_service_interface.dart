import 'package:dartz/dartz.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/data/model/built_table_row.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';

abstract class ContentServiceInterface {
  Future<List<BuiltTable?>> getAllTables();

  Future<Either<AuthFailure, List<String>>> getTableUrls(int mathId);

  Future<Either<AuthFailure, Unit>> uploadOnFileStorage(int table, int rowId);
}
