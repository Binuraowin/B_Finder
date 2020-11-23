import 'package:b_finder/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override

    final Function toggleView;

  const SignIn({Key key, this.toggleView}) : super(key: key);
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
    final _formKey =GlobalKey<FormState>();

  String email = '';
  String password = '';
   String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register'))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), topRight: Radius.circular(60.0))
              ),
              child: ListView(
                  primary: false,
                 padding: EdgeInsets.only(left: 25.0, right: 20.0),
                 children: <Widget>[
                   Form(
           key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 140.0),
              TextFormField(
                 validator: (val) => val.isEmpty  ? 'enter an email' :null,
                onChanged: (val){
                    setState(() {
                      email= val;
                    });
                },
              ),
                SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length <6 ? 'enter 6+ cratecctors password' :null,
                onChanged: (val){
                    setState(() {
                      password= val;
                    });
                },
              ),
               SizedBox(height: 20.0),
               RaisedButton(
                 color: Colors.blue[700],
                 child: Text(
                   'Sign In',
                   style: TextStyle(
                     color: Colors.white
                   ),
                 ),
                 onPressed: () async{
                     if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error='enter valid email';
                          });
                        }
                        print('valid');
                   }
                 }
                 ),
                 SizedBox(height: 12.0),
                 Text(
                   error,
                   style: TextStyle(color: Colors.red,fontSize: 14.0),
                 )
            ],
          )
          )
                 ],
              ),
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // child: 
    
      ),
    );
  }
}