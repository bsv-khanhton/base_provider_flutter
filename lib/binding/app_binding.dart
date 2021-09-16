import 'package:demogetx/user_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/home_controller.dart';
import 'my_class.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put<MyClass>(MyClass());
    Get.putAsync<SharedPreferences>(() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("ab", "Ahihi");
        return prefs;
      },permanent: true
    );

  }
}