import 'package:get/get.dart';

class ApiServices extends GetxService {
  // static const String url = 'http://192.168.0.13:8001/api';

  Future<String> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Success';
  }
}
