import 'package:basecode/helper/sharedPref.dart';

class AppSharedPreferences{

  final String TOKEN = "TOKEN";

  static final AppSharedPreferences _appSharedPreferences = new AppSharedPreferences._internal();

  String _token;

  factory AppSharedPreferences() {
    return _appSharedPreferences;
  }

  AppSharedPreferences._internal();


  String get token => _token;

  Future<String> getToken() async {
    _token = SharedPref().read(TOKEN);
    return Future.value(_token);
  }

  Future<Null> setToken(String token) async {
    SharedPref().save(TOKEN, token).then((bool onValue){
      print("Saved token");
    });
  }

  //Save user info
  Future<Null> clearData() async {
    setToken(null);
  }
}