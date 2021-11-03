import 'dart:io';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

class ViewImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    final img = Image.file(File(PRO.getTempPath));

    saveImage() async {
      await GallerySaver.saveImage(PRO.getTempPath); // save in Gallery
      await File(PRO.getTempPath).delete(); // delete temp
      PRO.clear(); // clear provider
      StatusAlert.show(
        context,
        duration: Duration(seconds: 4),
        title: 'Saved',
        subtitle: 'The image has been saved successfully',
        configuration: IconConfiguration(icon: Icons.done),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      );
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      await Navigator.pushReplacement(context, route);
    }

    closeScreen() async {
      await File(PRO.getTempPath).delete(); // delete temp
      PRO.clear(); // clear proivder
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      await Navigator.pushReplacement(context, route);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'B9MAH ENCRYPTION',
            style: TextStyle(
              fontFamily: 'Cairo',
              color: Colors.black,
              fontSize: 24,
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Encrypted Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 25,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.file(File(PRO.getTempPath))),
                  mainButton(
                      text: 'Save',
                      textSize: 25,
                      textColors: Colors.white,
                      icon: Icon(
                        Icons.add,
                        size: 42,
                        color: Colors.white,
                      ),
                      backGround: Colors.lightBlue,
                      fun: () {
                        saveImage();
                      })
                ],
              ),
            )),
      ),
    );
  }
}
