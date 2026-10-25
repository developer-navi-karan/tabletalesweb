import 'package:collection/collection.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/services/quiz_service.dart';

class QuizViewModel extends FutureViewModel<List<BuiltTable?>> {
  final _quizSerice = locator<QuizService>();

  Future<List<BuiltTable?>> getAllTables() async => _quizSerice.getAllTables();

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

  int? _selectedLevel;

  /// The selected level, defaulting to the first available level.
  int? get selectedLevel => _selectedLevel ?? tablesByLevel.keys.firstOrNull;

  List<BuiltTable> get selectedTables => tablesByLevel[selectedLevel] ?? [];

  void selectLevel(int level) {
    _selectedLevel = level;
    rebuildUi();
  }

  String getLevelName(int level) {
    final levelLabel = _allLevels[level];
    return 'Level $levelLabel';
  }

  @override
  Future<List<BuiltTable?>> futureToRun() => getAllTables();
}
