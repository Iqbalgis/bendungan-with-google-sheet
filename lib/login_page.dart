import 'package:bendungan/general_page.dart';
import 'package:bendungan/home_page.dart';
import 'package:bendungan/submit_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void check() {
    if (formkey.currentState.validate()) {
      print("Validated");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SubmitPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Masukan Password",
      subtitle: 'Masukan password untuk melanjutkan',
      onBackButtonPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 80, 40, 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Masukan password",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                      gapPadding: 10,
                    ),
                  ),
                  validator: (_val) {
                    if (_val == "psda") {
                      return null;
                    } else {
                      return "Password Salah";
                    }
                  },
                  obscureText: true,
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                onPressed: check,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: "0274BC".toColor(),
                child: Text(
                  'MASUK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
