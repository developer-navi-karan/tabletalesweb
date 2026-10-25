import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/data/model/built_table_row.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';
import 'package:tabletalesweb/services/content_service_interface.dart';
import 'package:tabletalesweb/services/supabase_service.dart';

class ContentService extends ContentServiceInterface {
  final _supabaseService = locator<SupabaseService>();

  @override
  Future<List<BuiltTable?>> getAllTables() async {
    final data = await _supabaseService.supabaseDb.from('math_table').select();
    return data
        .map((element) =>
            BuiltTable.fromJson(jsonEncode(sanitizeForJson(element))))
        .toList();
  }

  @override
  Future<Either<AuthFailure, List<String>>> getTableUrls(int mathId) async {
    try {
      final response = await _supabaseService.supabaseClient
          .from('table_row')
          .select('row_id, math_id, image_path')
          .eq('math_id', mathId)
          .order('row_id', ascending: true);

      final list = response
          .map((item) => BuiltTableRow.fromJson(jsonEncode(item)))
          .map((row) => row?.image_path)
          .nonNulls
          .map((path) => _supabaseService.supabaseStorage
              .from('table-images')
              .getPublicUrl(path))
          .toList();

      return right(list);
    } catch (_) {
      return left(const AuthFailure.serverError(
          title: "oh Snap!",
          description: "Something Went Wrong. Please try again later"));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> uploadOnFileStorage(
      int table, int rowId) async {
    try {
      if (kIsWeb) {
        FilePickerResult? result = await FilePicker.platform
            .pickFiles(type: FileType.image, withData: true);

        if (result != null) {
          final PlatformFile file = result.files.single;
          final bytes = file.bytes!;
          String fileName = 'tables/$table/t${table}_$rowId.png';

          // Upload file
          await _supabaseService.supabaseStorage
              .from('table-images')
              .uploadBinary(
                fileName,
                bytes,
                fileOptions: const FileOptions(
                  contentType: 'image/png',
                  upsert: true,
                  cacheControl: '0',
                ),
              );

          String baseUrl = await _supabaseService.supabaseStorage
              .from('table-images')
              .getPublicUrl(fileName);

          await CachedNetworkImage.evictFromCache(baseUrl);

          return right(unit);
        }
      }
      return left(const AuthFailure.serverError(
          title: "oh Snap!",
          description: "Something Went Wrong. Please try again later"));
    } on StorageException catch (e) {
      return left(const AuthFailure.serverError(
          title: "oh Snap!",
          description: "Something Went Wrong. Please try again later"));
    }
  }

  dynamic sanitizeForJson(dynamic value) {
    if (value is DateTime) {
      return DateFormat('yyyy-MM-dd')
          .parse(value.toIso8601String())
          .toIso8601String();
    } else if (value is Map<String, dynamic>) {
      return value.map((k, v) => MapEntry(k, sanitizeForJson(v)));
    } else if (value is List) {
      return value.map(sanitizeForJson).toList();
    } else {
      return value;
    }
  }
}
