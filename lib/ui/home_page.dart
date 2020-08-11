import 'package:basecode/providers/app_provider.dart';
import 'package:basecode/ui/base_state_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseStateApp<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildApp(BuildContext context, AppProvider appProvider) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home", style: TextStyle(fontSize: 28),),
      ),
    );
  }

}