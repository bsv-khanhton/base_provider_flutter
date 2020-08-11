import 'package:basecode/providers/base_provider.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends BaseProvider{
  String text = "Hello";
  ValueNotifier<String> onLoginSuccessed = ValueNotifier("");

  void doLogin(String email, String password) {
    showLoading();
    restData.loginEmail(email, password).then((value){
      hideLoading();
      print("Login done");
      onLoginSuccessed.value = "Login successed!";
      notifyListeners();

    }).catchError((onError){
      hideLoading();
      onLoadAPIError.value = onError;
    });
    notifyListeners();
  }
}