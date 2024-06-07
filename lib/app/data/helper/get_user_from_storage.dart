import 'package:football_quiz/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

User getUserFromStorage() {
  final box = GetStorage();

  var user = box.read('user');

  return User.fromJson(user['data']);
}
