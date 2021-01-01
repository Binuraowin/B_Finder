import 'package:b_finder/Screens/details.dart';
import 'package:b_finder/Screens/home.dart';
import 'package:b_finder/Screens/main_screens/postScreen.dart';
import 'package:b_finder/Screens/main_screens/productListPage.dart';
import 'package:b_finder/Screens/widgets/category.dart';
import 'package:b_finder/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:b_finder/screens/wrapper.dart';

import 'models/authUser.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}
