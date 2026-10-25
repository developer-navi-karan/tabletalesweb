import 'package:dartz/dartz.dart';
import 'package:tabletalesweb/data/model/built_quiz.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';

abstract class QuizServiceInterface {
  Future<List<BuiltTable?>> getAllTables();

  Future<Either<AuthFailure, List<BuiltQuiz?>>> getAllQuizzes(int level);

  Future<Either<AuthFailure, Unit>> updateQuiz(BuiltQuiz quiz);
}
