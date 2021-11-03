import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';

class MoreinfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'More Information',
            style: TextStyle(
              fontFamily: 'Cairo',
              color:  Colors.black,
              fontSize: 25,
            ),
          ),
          backgroundColor: Color(0xffA9DBEE),
          centerTitle: true,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),body: Container(
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
            )),child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 40),
                    child: Container(
                      child: Column(
                        children: [
                          Text('   If you want to encrypt or decrypt an image, b9mah is the right application for you. '
                              'It is easy to you and fun to work with. Your encrypted or decrypted image will be secure'
                              ' because we use a very complicated methods and logarithms to process the encryption or'
                              ' decryption. Doing so, makes it impossible for anyone who doesn’t have the key for '
                              'encryption and decryption to view the image. ',
                            style: TextStyle(fontSize: 18, ),textAlign: TextAlign.justify),
                          SizedBox(height: 30,),
                          Text('   This application has been made to meet the requirements for high security process of'
                              ' encryption and decryption to help people who want to send sensitive information '
                              'without any leaking of any part of this information. No one without having the key'
                              ' can view the content of the image even the developers of the application. We tried'
                              ' to make as simple as possible to help you doing your task without complications of usage.  ',
                              style: TextStyle(fontSize: 18, ),textAlign: TextAlign.justify),
                          SizedBox(height: 30,),
                          Text('   This app has been made by Nawaf Alkhadidi and Yasser Bamgabel for final graduation project.'
                              ' Our goal is to continue developing this application to improve it by adding more features'
                              ' to it that could help people to protect their information from being stolen.',
                              style: TextStyle(fontSize: 18, ),textAlign: TextAlign.justify),

                        ],
                      ),

      ),
                  ),
                ],
              ),
            ),

      ),
      )

    );
  }
}
