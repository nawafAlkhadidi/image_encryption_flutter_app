import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';

class privacySrceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(
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
        decoration: const BoxDecoration(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '   Our privacy policy will help you understand what information we collect at app B9mah '
                            'how B9mah uses it, and what choices you have. built the B9mah app as a free app.'
                            'This SERVICE is provided by B9mah at no cost and is intended for use as is.',
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            '   This app (B9MAH) does not use & does not share any user information'
                            ', and any information used in this application, we cannot access it. ',
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            '   We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes.'
                            'We will notify you of any changes by posting the new Privacy Policy on this page.'
                            'These changes are effective immediately, after they are posted on this page.',
                            style: TextStyle(
                              fontSize: 18,
                              color: BlackColor,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(
                          height: 30,
                        ),
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
