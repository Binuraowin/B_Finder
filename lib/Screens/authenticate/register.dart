
import 'package:b_finder/services/auth.dart';
import 'package:flutter/material.dart';

import 'inputdeco.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  const Register({Key key, this.toggleView}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String name, email, pass;
  int phone;
  bool loading = false;
  String error = '';
  String imageUrl;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign Up'))
        ],
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email, "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.lock, "Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please a Enter Password';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          pass = val;
                        });
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: confirmpassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.lock, "Confirm Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please re-enter password';
                        }
                        print(password.text);

                        print(confirmpassword.text);

                        if (password.text != confirmpassword.text) {
                          return "Password does not match";
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        pass = value;
                      },

                    ),
                  ),


                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, pass);
                          if (result == null) {
                            setState(() {
                              error = 'enter valid email';
                            });
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue, width: 2)
                      ),
                      textColor: Colors.white,
                      child: Text("Register"),

                    ),

                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



