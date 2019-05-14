import 'package:flutter/material.dart';
import 'package:flutter_social/ui/home/settings/widgets/custom_flat_button.dart';
import 'package:flutter_social/utils/auth.dart';
import 'package:flutter_social/ui/login/screens/login_screen.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/utils.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                customFlatButton(creditCard, 'Payment info / cards', 0),
                customFlatButton(usersAdds, 'Invite Friends', 60.0),
                customFlatButton(star, 'Rate the app', 70.0),
                customFlatButton(security, 'Privacity', 100.0),
                customFlatButton(question, 'Support and help', 30.0),
              ],
            ),
            RaisedButton(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              onPressed: () {
                logout();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    Auth.signOut();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  }
}
