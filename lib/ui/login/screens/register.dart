import 'package:flutter/material.dart';
import 'package:flutter_social/ui/login/screens/sign_in_tab.dart';
import 'package:flutter_social/ui/login/screens/register_tab.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  Tab _tab(String title) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(color: Colors.deepOrange),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Continue with Email",
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.deepOrange,
          tabs: <Widget>[
            _tab("SIGN IN"),
            _tab("REGISTER"),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          SignInTab(),
          RegisterTab(),
        ],
        controller: controller,
      ),
    );
  }
}
