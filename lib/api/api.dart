import 'package:basecode/helper/app_shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RestData{

  static final RestData _restData = new RestData._internal();

  RestData._internal();

  factory RestData() {
    return _restData;
  }

  static Map<String, String> token = Map();

  static final LIMIT = 7;

  static final KEY_AUTH_HEADER = "Authorization";

  static final BASE_URL = DotEnv().env['API_URL'];

  static final LOGIN_URL = BASE_URL+"/posts/1";

  Future<Null> _getHeaderAuth() async{
    if(!token.containsKey(KEY_AUTH_HEADER )){
      await AppSharedPreferences().getToken().then((__token){
        token = {KEY_AUTH_HEADER: "Bearer "+__token};
      });
    }
  }

  Future<http.Response> loginEmail(String email, String password) async{
    return await http.post(LOGIN_URL, body: {"email": email, "password": password});
  }

  Future<http.Response> loadDetailFAQ(String idFAQ) async{
    await _getHeaderAuth();
    return await http.get(
        "",
        headers: token
    );
  }
}