

import 'package:b_finder/models/authUser.dart';
import 'package:b_finder/screens/authenticate/authenticate.dart';
import 'package:b_finder/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authuser = Provider.of<AuthUser>(context);
   if(authuser == null){
     return Authenticate();
   }else{
     return Home();
   }
    
  }
}