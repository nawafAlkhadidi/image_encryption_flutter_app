import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Screen/WelcomScreen/welcom_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';

var providersList = [
  ChangeNotifierProvider(create: (context) => ImagesProvider()),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var initScreen = prefs.getBool("initScreen");
  // initScreen = prefs.getString("initScreen");
  print(initScreen);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final initScreen;
  const MyApp({Key key, @required this.initScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providersList,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initScreen == false || initScreen == null
              ? "/welcomePage"
              : "/homePage",
          routes: {
            '/welcomePage': (context) => WelcomPage(),
            "/homePage": (context) => HomePage(),
          },
        ));
  }
}
