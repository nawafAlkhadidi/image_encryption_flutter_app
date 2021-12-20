import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/applocal.dart';

class MoreinfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('More_information'),

          style: TextStyle(
            fontFamily: 'Cairo',
            color: BlackColor,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xffA9DBEE),
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: BlackColor,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            BoxBackgroundColor0,
            BoxBackgroundColor1,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('More_information_text1'),
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('More_information_text2'),
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('More_information_text3'),
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppLocalizations.of(context).translate('More_information_text4'),
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
