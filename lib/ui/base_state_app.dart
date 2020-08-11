import 'dart:async';
import 'dart:io';

import 'package:basecode/providers/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:provider/provider.dart';

abstract class BaseStateApp<T extends StatefulWidget> extends State<T>{
  bool loading = false;
  GlobalKey<ScaffoldState> globalKeyScaffold = GlobalKey<ScaffoldState>();

  Widget cupertinoActivityIndicator = CupertinoActivityIndicator(
    animating: true,
    radius: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider appProvider, Widget child) {
          return buildApp(context, appProvider);
        });
  }

  Widget buildApp(BuildContext context, AppProvider appProvider);

  void onApiError(dynamic onError) {
    // TODO: implement onApiError
    hideLoading();
    if((onError is SocketException) || (onError is TimeoutException)){
      log("error timeout:" + onError.toString());
    }
    else{
      log("error: " + onError.toString());
    }
    showMessage(onError.toString(), isError: true);
  }

  void onApifailed(String mgs) {
    // TODO: implement onApiError
    hideLoading();
    log("onApifailed: $mgs");
  }

  void showMessage(String mgs, {bool isError=false}){
    log("showMessage: $mgs");
    showAlert(
      context: context,
      body: mgs,
    );
  }


  void showLoading() {
    if(mounted)
      setState(() {
        loading = true;
      });
  }

  void hideLoading() {
    if(mounted)
      setState(() {
        loading = false;
      });
  }

  void hideKeyboard() {
    if(mounted)
      FocusScope.of(context).requestFocus(new FocusNode());
  }

  void log(String msg){
    print("BSV---> $msg");
  }

}