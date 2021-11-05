import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomPage extends StatelessWidget {
  
  static const pageDecoration  = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(
        fontSize: 19.0, color: Colors.black45, fontWeight: FontWeight.w600),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    imagePadding: EdgeInsets.only(top: 30),
  imageAlignment: Alignment.centerLeft
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Enter the Plain image",
        body:
            "Just click and enter the image you want to encrypt",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child:  Image.asset('images/welcom_screen/step1.png',),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "ِEnter the Key image",
        body:
            "this key image ",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child: Image.asset('images/welcom_screen/step2.png'),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
          title: "Easy to Implementation",
          body:
              "The aim of the project is to develop a program for encryption images.To maintain users' privacy.",
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
      // globalBackgroundColor: Color(0xffA9DBEE),
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

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
}
