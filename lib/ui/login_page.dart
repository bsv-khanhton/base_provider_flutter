import 'package:basecode/helper/constants.dart';
import 'package:basecode/providers/app_provider.dart';
import 'package:basecode/providers/login_provider.dart';
import 'package:basecode/ui/base_provider_state_app.dart';
import 'package:basecode/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseProviderStateApp<LoginPage, LoginProvider>{
  GlobalKey<FormState> _globalKeyFormState = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  void _switchThemeMode(AppProvider appProvider) {
    if(appProvider.theme ==
        Constants.lightTheme){
      appProvider.setTheme(Constants.darkTheme, "dark");
    }else{
      appProvider
          .setTheme(Constants.lightTheme, "light");
    }
  }

  @override
  Widget buildAppWithProvider(BuildContext context, AppProvider appProvider, LoginProvider provider) {
    initProviderListener(provider);
    return Scaffold(
      key: _globalKeyFormState,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailTextEditingController,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    hintText: "Email",
                    fillColor: Colors.white70),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordTextEditingController,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    hintText: "Password",
                    fillColor: Colors.white70),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                // height: double.infinity,
                child: RaisedButton(child: Text("Login"),
                  onPressed: (){
                    _doLogin(provider);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.grey,
                )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _switchThemeMode(appProvider);
        },
        tooltip: 'Increment',
        child: Icon(Icons.brightness_4),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _doLogin(LoginProvider provider){
    String email = emailTextEditingController.text.trim();
    String password = passwordTextEditingController.text.toString();
    if(email.isEmpty){
      showMessage("Please enter email");
      return;
    }
    if(password.isEmpty){
      showMessage("Please enter password");
      return;
    }
    provider.doLogin(email, password);
  }

  @override
  LoginProvider providerInit() {
    return LoginProvider();
  }

  void initProviderListener(LoginProvider provider) {
    if(!provider.onLoginSuccessed.hasListeners){
      provider.onLoginSuccessed.addListener(() {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: HomePage(),
          ),
        );
      });
    }
  }

}