import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/forgotpassword.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signup.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Widget _defaulthome;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userId = await prefs.getString('email');
   if (userId != null) {
    _defaulthome = new Home();
  }else{
    _defaulthome = new LoginPage();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp(_defaulthome));
  });

}

class MyApp extends StatelessWidget {
  final _defaulthome ;

  MyApp(this._defaulthome);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Movie Booking',
      theme: ThemeData(primaryColor: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: _defaulthome,
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => new Home(),
        'login': (BuildContext context) => new LoginPage(),
        'forgotpassword': (BuildContext context) => ForgotPassword(),
        'signup':(BuildContext context) => SignUp(),
      },
    );
  }
}


