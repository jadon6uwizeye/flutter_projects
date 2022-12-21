

import '../../enums/difficulty.dart';
import '../../models/question_model.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
