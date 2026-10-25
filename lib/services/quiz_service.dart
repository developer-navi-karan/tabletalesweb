import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_quiz.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';
import 'package:tabletalesweb/services/quiz_service_inteface.dart';
import 'package:tabletalesweb/services/supabase_service.dart';

class QuizService extends QuizServiceInterface {
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
  Future<Either<AuthFailure, List<BuiltQuiz?>>> getAllQuizzes(int level) async {
    try {
      final data = await _supabaseService.supabaseDb
          .from('miscQuiz_Qestion')
          .select()
          .eq('quiz_id', level);
      final list = data
          .map((element) =>
              BuiltQuiz.fromJson(jsonEncode(sanitizeForJson(element))))
          .toList();
      return right(list);
    } on PostgrestException catch (e) {
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

  @override
  Future<Either<AuthFailure, Unit>> updateQuiz(BuiltQuiz quiz) async {
    try {
      await _supabaseService.supabaseDb
          .from('miscQuiz_Qestion')
          .update(jsonDecode(quiz.toJson()))
          .eq('question_id', quiz.question_id!)
          .select()
          .single();

      return right(unit);
    } on PostgrestException catch (e) {
      return left(const AuthFailure.serverError(
          title: "oh Snap!",
          description: "Something Went Wrong. Please try again later"));
    }
  }
}
