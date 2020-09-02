import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/text_input.widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();
  TextEditingController referalCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _resetForm() {
    fullNameController.text = '';
    emailController.text = '';
    mobileNumberController.text = '';
    countryController.text = '';
    passwordController.text = '';
    confirmedPasswordController.text = '';
    referalCodeController.text = '';
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  _showFormValues() {
    print(
      'Full Name: ${fullNameController.text}\n'
      'Email:  ${emailController.text}\n'
      'Mobile Number: ${mobileNumberController.text}\n'
      'Country: ${countryController.text}\n'
      'Password: ${passwordController.text}\n'
      'Confirm Password: ${confirmedPasswordController.text}\n'
      'Referal Code:  ${referalCodeController.text}\n'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 70, right: 30, left: 30, bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(0),
                      onPressed: _resetForm,
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                SizedBox(height: 50),
                TextInputWidget(
                  labelText: 'Full Name',
                  controller: fullNameController,
                ),
                TextInputWidget(
                  labelText: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextInputWidget(
                  labelText: 'Mobile Number',
                  controller: mobileNumberController,
                  keyboardType: TextInputType.number,
                ),
                TextInputWidget(
                  labelText: 'Country',
                  controller: countryController,
                ),
                TextInputWidget(
                  labelText: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                TextInputWidget(
                  labelText: 'Confirm Password',
                  controller: confirmedPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                TextInputWidget(
                  labelText: 'Referal Code (Optional)',
                  controller: referalCodeController,
                ),
                SizedBox(height: 40),
                RaisedButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    )),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _showFormValues();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
