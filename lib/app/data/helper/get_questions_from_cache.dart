import 'package:football_quiz/app/modules/quiz/question_model.dart';
import 'package:get_storage/get_storage.dart';

List<Question> getQuestionsFromCache() {
  final box = GetStorage();
  
  Map<String, dynamic>? cachedData = box.read('questionsCache');

  if (cachedData == null) {
    return [];
  }

  // Mendapatkan daftar pertanyaan dari data yang disimpan
  List<dynamic> questionsJson = cachedData['data'];

  // Mengonversi JSON ke List<Question>
  List<Question> questions =
      questionsJson.map((json) => Question.fromJson(json)).toList();

  return questions;
}
