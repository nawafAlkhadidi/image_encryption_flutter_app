import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Screen/WelcomScreen/welcom_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';

var providersList = [
  ChangeNotifierProvider(create: (context) => ImagesProvider()),
];
int isviewed;
Future<void> main() async {
  
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providersList,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isviewed != 0 ? "/welcomePage" : "/homePage",
          routes: {
            '/welcomePage': (context) => WelcomPage(),
            "/homePage": (context) => HomePage(),
          },
        ));
  }
}
