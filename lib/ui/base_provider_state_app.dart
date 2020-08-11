import 'package:basecode/providers/app_provider.dart';
import 'package:basecode/providers/base_provider.dart';
import 'package:basecode/ui/base_state_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseProviderStateApp<T extends StatefulWidget, P extends BaseProvider> extends BaseStateApp<T>{

  Widget buildAppWithProvider(BuildContext context, AppProvider appProvider, P provider);

  P providerInit();

  BaseProvider _baseProvider;



  @override
  Widget buildApp(BuildContext context, AppProvider appProvider) {
    return ChangeNotifierProvider<P>(
      create: (context) => _baseProvider = providerInit(),
      child: Consumer<P>(
        builder: (context, myModel, child){
          return buildAppWithProvider(context, appProvider, myModel);
        },
      ),
    );
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(_baseProvider != null && !_baseProvider.onShowLoading.hasListeners){
      _initBaseProvider();
    }
  }

  _initBaseProvider(){
    _baseProvider.onShowLoading.addListener(() {
      if(_baseProvider.onShowLoading.value){
        showLoading();
      }else{
        hideLoading();
      }
    });

    _baseProvider.onLoadAPIError.addListener(() {
      onApiError(_baseProvider.onLoadAPIError.value);
    });
  }
}