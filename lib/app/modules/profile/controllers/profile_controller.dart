import 'package:football_quiz/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();

  late Rx<User> user;

  @override
  void onInit() {
    var userData = box.read('user');

    user = User.fromJson(userData['data']).obs;

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
