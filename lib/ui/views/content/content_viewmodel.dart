import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';
import 'package:tabletalesweb/services/content_service.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:toastification/toastification.dart';

class ContentViewModel extends FutureViewModel<List<BuiltTable?>> {
  final _contentService = locator<ContentService>();

  // Replaced on every table selection: the paginator remounts each time and
  // adds a listener in initState, so a shared controller would keep stale ones.
  NumberPaginatorController controller = NumberPaginatorController();

  List<String> list = [];

  Future<List<BuiltTable?>> getAllTables() async =>
      _contentService.getAllTables();

  Future<Either<AuthFailure, List<String>>> getTableUrls(int mathId) async =>
      _contentService.getTableUrls(mathId);

  Future<Either<AuthFailure, Unit>> uploadOnFileStorage(
          int table, int rowId) async =>
      _contentService.uploadOnFileStorage(table, rowId);

  static const _allLevels = {
    1: "Basic (2-5)",
    2: "D (6-10)",
    3: "C (11-15)",
    4: "B (16-20)",
    5: "A (21-25)",
    6: "A+ (26-30)"
  };

  /// Tables grouped by level, with levels and tables in ascending order.
  Map<int, List<BuiltTable>> get tablesByLevel {
    final tables = (data ?? []).nonNulls.where((t) => t.level_id != null);
    final grouped = groupBy(tables, (BuiltTable t) => t.level_id!);
    final levels = grouped.keys.toList()..sort();
    return {
      for (final level in levels)
        level: grouped[level]!
          ..sort((a, b) => (a.table_number ?? 0).compareTo(b.table_number ?? 0))
    };
  }

  BuiltTable? selectedTable;

  bool isLoadingUrls = false;

  Future<void> selectTable(BuiltTable table) async {
    selectedTable = table;
    list = [];
    controller = NumberPaginatorController();
    isLoadingUrls = true;
    rebuildUi();

    final mathId = table.math_id;
    final result = mathId == null
        ? right<AuthFailure, List<String>>([])
        : await getTableUrls(mathId);

    // Ignore the response if another table was selected meanwhile.
    if (selectedTable != table) return;
    result.fold((l) {}, (r) => list = r);
    isLoadingUrls = false;
    rebuildUi();
  }

  /// Called by the edit button on the image at [index] in [list].
  void editImage(int table, int index) {
    uploadOnFileStorage(table, index + 1).then((value) async {
      value.fold((l) async {
        l.mapOrNull(serverError: (value) {
          showToast(
              type: ToastificationType.error,
              title: value.title,
              description: value.description);
        });
      }, (r) async {
        // The upload keeps the same URL, so the old image stays cached by
        // CachedNetworkImage, the browser and the CDN. Evict it and add a
        // cache-busting query so the new file is fetched.
        final oldUrl = list[index];
        await CachedNetworkImage.evictFromCache(oldUrl);
        final uri = Uri.parse(oldUrl);
        list[index] = uri.replace(queryParameters: {
          ...uri.queryParameters,
          'v': DateTime.now().millisecondsSinceEpoch.toString(),
        }).toString();
        rebuildUi();
        showToast(
            type: ToastificationType.success,
            title: "Image uploaded successfully",
            description: "Recheck the table images once to confirm");
      });
    });
  }

  String getLevelName(int level) {
    final levelLabel = _allLevels[level];
    return 'Level $levelLabel';
  }

  Future<void> showToast(
      {required ToastificationType type,
      required String title,
      required String description}) async {
    toastification.show(
      type: type,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kcPopMenuItem),
      ),
      description: Text(
        description,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: kcPopMenuItem),
      ),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  @override
  Future<List<BuiltTable?>> futureToRun() => getAllTables();
}
