import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';


class EncryptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    Future<void> run1() async {
      await Navigator.of(context).pushNamed('/imageView');
    }

    void BottomSheet(int num) => showModalBottomSheet(
      isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.camera_alt_outlined,
                      color:  BlackColor,
                    ),
                    title: Text('From the camera', style: TextStyle(
                      color: BlackColor,)),
                    onTap: () => {
                      if (num == 0)
                        {Navigator.pop(context),PRO.pickImage('plain', ImageSource.camera)},
                      if (num == 1) {Navigator.pop(context),PRO.pickImage('key', ImageSource.camera)}
                    },
                  ),
                  Container(
                    height: 1,
                    color: BlackColor.withOpacity(0.5),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.image,
                      color:  BlackColor,
                    ),
                    title: Text('From the gallery'),
                    onTap: () => {
                      if (num == 0)
                        {Navigator.pop(context),PRO.pickImage('plain', ImageSource.gallery)},
                      if (num == 1)
                        {Navigator.pop(context),PRO.pickImage('key', ImageSource.gallery)}
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ));

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'B9MAH ENCRYPTION',
            style: TextStyle(
              color: BlackColor,
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color(0xffA9DBEE),
          centerTitle: true,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color:  BlackColor,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                  SizedBox(height: 10),
                  Text(
                    'Plain image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BlackColor,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                      width: 260,
                      height: 260,
                      color: Colors.white.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              BottomSheet(0);
                            },
                            child: PRO.isImagePlainPicked
                                ? Image.file(File(PRO.getImagePlainPath),
                                    height: 240,
                                    width: 240,
                                    fit: BoxFit.contain)
                                : Icon(
                                    Icons.camera_alt_outlined,
                                    size: 50,
                                    color: BlackColor,
                                  ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Key image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BlackColor,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 260,
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => {
                            BottomSheet(1),
                          },
                          child: PRO.isImageKeyPicked
                              ? Image.file(File(PRO.getImageKeyPath),
                                  height: 240, width: 240, fit: BoxFit.contain)
                              : Icon(
                                  Icons.camera_alt_outlined,
                                  size: 50,
                                  color: BlackColor,
                                ),
                        ),
                      ],
                    ),
                  ),

                  // PRO.loading
                  //     ? CircularProgressIndicator()
                  //     : OutlinedButton(onPressed: run1, child: Text("encrypt")),
                  // CircularProgressIndicator(),
                  PRO.isImageKeyPicked && PRO.isImagePlainPicked
                      ? mainButton(
                          backGround:  EncryptButtonColor,
                          text: 'Encrypt',
                          icon: Icon(
                            Icons.lock,
                            color: WhiteColor,
                            size: 36.0,
                          ),
                          fun: () {
                            PRO.isImageKeyLargerThanPlain()
                                ? PRO.loading
                                    ? CircularProgressIndicator()
                                    : PRO.run(context)
                                : StatusAlert.show(
                                    context,
                                    duration: Duration(seconds: 5),
                                    title: 'Wrong',
                                    subtitle:
                                        'Image key must be larger than Image plain',
                                    configuration:
                                        IconConfiguration(icon: Icons.error),
                                    backgroundColor: WhiteColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    dismissOnBackgroundTap: true,
                                  );
                          },
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 20),
                ],
              ),
            )),
      ),
    );
  }
}