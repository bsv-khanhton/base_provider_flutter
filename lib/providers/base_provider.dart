import 'package:basecode/api/api.dart';
import 'package:flutter/widgets.dart';

abstract class BaseProvider with ChangeNotifier{
  ValueNotifier<bool> onShowLoading = ValueNotifier(false);
  ValueNotifier<String> onLoadAPIFail = ValueNotifier("");
  ValueNotifier<dynamic> onLoadAPIError = ValueNotifier(null);

  showLoading(){
    onShowLoading.value = true;
    notifyListeners();
  }

  hideLoading(){
    onShowLoading.value = false;
    notifyListeners();
  }

  RestData restData = RestData();

}