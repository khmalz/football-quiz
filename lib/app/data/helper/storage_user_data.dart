import 'package:football_quiz/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

Future<void> storeUserToStorage(User model) async {
  final box = GetStorage();

  int loginTime = DateTime.now().millisecondsSinceEpoch;

  await box.write('user', {
    'login_at': loginTime,
    'data': model.toJson(),
  });
}
