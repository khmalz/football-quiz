import 'package:football_quiz/app/modules/level/providers/level_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LevelController extends GetxController {
  RxBool isClickLockLevel = false.obs;
  RxBool isClickPlayLevelAgain = false.obs;
  RxInt levelClickAgain = 0.obs;

  String category = Get.parameters['category'].toString();

  LevelProvider levelProvider = LevelProvider();

  Future<dynamic> getLevel() async {
    final box = GetStorage();
    final userId = box.read('user');

    final categoryCacheKey = 'cache_$category';
    final cachedData = box.read(categoryCacheKey);

    if (cachedData != null) {
      final cachedTime = DateTime.parse(cachedData['expired_time']);

      if (DateTime.now().difference(cachedTime).inMinutes < 10) {
        return cachedData['data'];
      }
    }

    final result = await levelProvider.getLevel(userId['data']['id'], category);

    final newExpiredTime =
        DateTime.now().add(const Duration(minutes: 10)).toIso8601String();
    final data = {
      'expired_time': newExpiredTime,
      'data': result,
    };
    box.write(categoryCacheKey, data);

    return result;
  }
}
