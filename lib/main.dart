import 'package:basecode/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'ui/login_page.dart';

void main() async{
  /*------------Setup Env-------------*/
  String dev = "assets/env/.env_dev";
  String prod = "assets/env/.env_prod";
  await DotEnv().load(dev);
  /*------------End Setup Env-------------*/

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
            key: appProvider.key,
            debugShowCheckedModeBanner: false,
            navigatorKey: appProvider.navigatorKey,
            title: "BSV",
            theme: appProvider.theme,
            home: LoginPage()
        );
      },
    );
  }
}
