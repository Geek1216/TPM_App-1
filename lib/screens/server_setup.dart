import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tpmapp/constants/my_style.dart';
import 'package:tpmapp/constants/routes_name.dart';
import 'package:tpmapp/services/preferences_service.dart';

class Serversetup extends StatefulWidget {
  final PreferencesService pref;

  Serversetup(this.pref, {Key key}) : super(key: key);
  @override
  State<Serversetup> createState() => _ServersetupState(this.pref);
}

class _ServersetupState extends State<Serversetup> {
  final urlController = TextEditingController();
  final passwordController = TextEditingController();
  bool response = false;
  PreferencesService pref;
  _ServersetupState(this.pref);
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    urlController.dispose();
    super.dispose();
  }

  verifyPassword() {
    setState(() {
      passwordController.text.toString() == 'admin'
          ? response = true
          : Fluttertoast.showToast(
              msg: "Please enter correct password",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue[300],
              textColor: Colors.white,
              fontSize: 16.0);
    });
    response == true ? passwordController.clear() : Container();
  }

  validateBaseUrl() {
    urlController.text.toString() != ''
        ? updateBaseUrl()
        : Fluttertoast.showToast(
            msg: "Please enter new url",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue[300],
            textColor: Colors.white,
            fontSize: 16.0);
  }

  updateBaseUrl() {
    String updateUrl = urlController.text.trim().replaceAll(' ', '');
    pref.updateBaseURl = updateUrl;
    urlController.clear();
    setState(() {
      response = false;
    });
    Fluttertoast.showToast(
        msg: "Base url changed successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue[300],
        textColor: Colors.white,
        fontSize: 16.0);
    log('==========new base url =======> ${pref.getNewBaseURl}');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Server setup'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.modeSelection);
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: response == false ? true : false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter password',
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: response == false ? true : false,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => verifyPassword(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text('Submit'),
                    )),
              ),
              Visibility(
                visible: response == true ? true : false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter new base url here',
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: response == true ? true : false,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => validateBaseUrl(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text('Update'),
                    )),
              )
            ],
          ),
        ),
      );
}
