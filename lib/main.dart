import 'package:flutter/material.dart';
import 'package:post_app/src/homePage.dart';
import 'package:post_app/src/loginPage.dart';
import 'package:flutter/services.dart';
import 'package:post_app/src/profilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Post App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    initialRoute: loginPage.id,
    routes: {
      loginPage.id: (context) => loginPage(),
      //homePage.id: (context) => homePage(),
      //profilePage.id: (context) => profilePage(),
    },
    );
  }
}
