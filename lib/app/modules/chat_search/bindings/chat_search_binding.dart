import 'package:get/get.dart';

import '../controllers/chat_search_controller.dart';

class ChatSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatSearchController>(
      () => ChatSearchController(),
    );
  }
}
