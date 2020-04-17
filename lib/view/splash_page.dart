import 'package:flutter/material.dart';
import 'package:practica1/view/marvel_list_page.dart';

class SplashPage extends StatelessWidget {

  ///Constructor de la pantalla de inicio de la aplicacion
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (_) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => MarvelListPage(),
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 250),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: Image.asset('assets/images/marvel.png', fit: BoxFit.fitWidth),
            ),
            SizedBox(height: 20),
            Text(
              'Marvel App',
              style: TextStyle(
                fontFamily: "AmericanCaptain",
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
