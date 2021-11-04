import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/ViewScreen/ViewImage.dart';
import 'Screen/MainScreen/welcom_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';

import 'package:provider/provider.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var providersList = [
    ChangeNotifierProvider(create: (context) => ImagesProvider()),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providersList,
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'Cairo'),
            debugShowCheckedModeBanner: false,
            initialRoute:
                initScreen == 0 || initScreen == null ? "/first" : "/",
            routes: {
              '/': (context) => WelcomPage(),
              "/first": (context) => WelcomPage(),
              "/imageView": (context) => ViewImage()
            }) //WelcomPage(),
        );
  }
}
