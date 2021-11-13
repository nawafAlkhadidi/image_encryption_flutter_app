import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomPage extends StatelessWidget {
  savePref(var numPag ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("initScreen", numPag);
    prefs.setBool("initScreen" , true);
    print(prefs.getBool("initScreen"));
  }

  static const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(
          fontSize: 19.0, color: Colors.black45, fontWeight: FontWeight.w600),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.only(top: 30),
      imageAlignment: Alignment.centerLeft);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Enter The Plain Image",
        body: "Just click and chose the image you want to encrypt or decrypt",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child: Image.asset(
            'images/welcom_screen/step1.png',
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Enter The Key Image",
        body:
            "Enter another image to use it as a key which is required to encode the original image that you want to decrypt or encrypt",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child: Image.asset('images/welcom_screen/step2.png'),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
          title: "Ready To Use",
          body:
              "Now the image is eather encrypted or decrpted upon your choice. Don't forgot you must have your key image!",
          image: Padding(
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: Image.asset('images/welcom_screen/step3.png'),
          ),
          decoration: pageDecoration)
    ];
  }

  Widget build(BuildContext context) {
    return Container(
        child: IntroductionScreen(
      done: Text(
        'Done',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 19,
        ),
      ),
      skip: Text(
        'Skip',
        style: TextStyle(
          color: Colors.black45,
          fontSize: 19,
        ),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: Colors.blue,
        size: 27.0,
      ),
      showSkipButton: true,
      onDone: () => goToHome(context),
      onSkip: () => goToHome(context),
      pages: getPages(),
      globalBackgroundColor: Color(0xffE7ECF5),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    ));
  }

  void goToHome(context) async {
    savePref('1');
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }
}
