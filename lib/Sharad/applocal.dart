// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class   AppLocale {

//   Locale locale ;

//   AppLocale(this.locale) ;

// Map<String , String> _loadedLocalizedValues ;

//   static AppLocale of (BuildContext context) {
//        return Localizations.of(context, AppLocale) ;
//   }

//   Future loadLang() async {
//     String  _langFile = await rootBundle.loadString('language/${locale.languageCode}.json') ;
//     Map<String ,dynamic> _loadedValues = jsonDecode(_langFile);
//     _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
//   }

//   String getTranslated (String key) {
//     return _loadedLocalizedValues[key] ;
//   }

//   static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate() ;

// }


// class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
//   const _AppLocalDelegate() ;
//   @override
//   bool isSupported(Locale locale) {
//     return ["en" , "ar"].contains(locale.languageCode) ;
//   }

//   @override
//   Future<AppLocale> load(Locale locale) async {
//      AppLocale appLocale = AppLocale(locale) ;
//        await appLocale.loadLang();
//        return appLocale ; 
//   }

//   @override
//   bool shouldReload(_AppLocalDelegate  old) => false  ;

// }

// getLang(BuildContext context  , String key) {
//    return AppLocale.of(context).getTranslated(key) ; 
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations{
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String,String> _localizedStrings;

  Future<bool> load() async{
    String jsonString = await rootBundle.loadString('language/${locale.languageCode}.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value){
      return MapEntry(key,value.toString());
    });
    return true;
  }

  String translate(String key){
    return _localizedStrings[key];
  }

  
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}