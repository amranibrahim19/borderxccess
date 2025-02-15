import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WelcomeController extends GetxController {
  var version = ''.obs;

  @override
  void onInit() {
    getVersion();
    super.onInit();
  }

  Future<void> getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }
}
