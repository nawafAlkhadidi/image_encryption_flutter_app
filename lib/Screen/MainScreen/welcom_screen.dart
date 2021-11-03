import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomPage extends StatelessWidget {
  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(
        fontSize: 19.0, color: Colors.black45, fontWeight: FontWeight.w600),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    //imagePadding: EdgeInsets.zero,
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Easy to Use",
        body:
            "The aim of the project is to develop a program for encryption images.To maintain users' privacy.",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child:  Image.asset('images/snap.png', height: 260.0),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "High Level Security",
        body:
            "The aim of the project is to develop a program for encryption images.To maintain users' privacy.",
        image: Padding(
          padding: const EdgeInsetsDirectional.only(top: 30),
          child: Image.asset('images/private-key.png', height: 260.0),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
          title: "Easy to Implementation",
          body:
              "The aim of the project is to develop a program for encryption images.To maintain users' privacy.",
          image: Padding(
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: Image.asset('images/gear.png', height: 260.0),
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
