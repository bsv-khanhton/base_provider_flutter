import 'package:basecode/models/login_dto.dart';
import 'package:basecode/providers/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class LoginProvider extends BaseProvider{
  String text = "Hello";
  ValueNotifier<LoginDTO> onLoginSuccessed = ValueNotifier(null);

  void doLogin(String email, String password) {
    showLoading();
    restData.loginMockup(email, password).then((value){
      hideLoading();
      onLoginSuccessed.value = LoginDTO.fromJson(json.decode(value.body));
      notifyListeners();

    }).catchError((onError){
      hideLoading();
      onLoadAPIError.value = onError;
    });
    notifyListeners();
  }
}