import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kalkulatormobileapps/components/constants.dart';
import 'package:kalkulatormobileapps/components/default_button.dart';

import '../main_page.dart';
import '../size_config.dart';

class LoginMainForm extends StatefulWidget {
  @override
  _LoginMainFormState createState() => _LoginMainFormState();
}

class _LoginMainFormState extends State<LoginMainForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/imgs/logo.png",
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(200),
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  buildUsername(),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  buildPasswordFormField(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              )),
          buildForgot(),
          SizedBox(height: getProportionateScreenHeight(40)),
          Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("OR"),
            Expanded(child: Divider()),
          ]),
          SizedBox(height: getProportionateScreenHeight(20)),
          OutlineButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            onPressed: () {},
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  "assets/imgs/google-logo.png",
                  width: 30,
                  height: 30,
                ),
                Text(
                  'Sign In with Google',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          OutlineButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            onPressed: () {},
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  "assets/imgs/facebook-logo.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Sign In with Facebook',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Login",
            color: Colors.black,
            labelColor: Colors.white,
            press:
                // () {
                // if (_formKey.currentState.validate()) {
                //   submit();
                //   // if all are valid then go to success screen
                //   // Navigator.pushNamed(context, HomeScreen.routeName);
                // }
                // },
                () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainPage()))
            },
          ),
        ],
      ),
    );
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  TextFormField buildUsername() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: "Email", labelStyle: TextStyle(fontWeight: FontWeight.w700),
        hintText: "Enter your email address",
        hintStyle: TextStyle(fontSize: 10),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
    );
  }

  InkWell buildForgot() {
    return InkWell(
      child: Text(
        "Forgot Password",
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: _secureText,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 7) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 7) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          hintStyle: TextStyle(fontSize: 10),
          border: OutlineInputBorder(),

          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            onPressed: showHide,
            icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
          )),
    );
  }
}
