import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Screen/WelcomScreen/welcom_screen.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var providersList = [
  ChangeNotifierProvider(create: (context) => ImagesProvider()),
];
int isviewed;
SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providersList,
        child: MaterialApp(
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
          // AppLocale.delegate,
          AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          localeResolutionCallback: (currentLang, supportLang) {
            if (currentLang != null) {
              for (Locale locale in supportLang) {
                if (locale.languageCode == currentLang.languageCode) {
                  prefs.setString("lang", currentLang.languageCode);
                  return currentLang;
                }
              }
            }
            return supportLang.first;
          },
          debugShowCheckedModeBanner: false,
          initialRoute: isviewed != 0 ? "/welcomePage" : "/homePage",
          routes: {
            '/welcomePage': (context) => WelcomPage(),
            "/homePage": (context) => HomePage(),
          },
        ));
  }
}
