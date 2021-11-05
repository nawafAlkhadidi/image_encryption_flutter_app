import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';

class DecryptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    // Future<void> run() async {
    //
    //   imgl.Image img =
    //   await EncryptDecrypt(PRO.getImagePlainPath, PRO.getImageKeyPath);
    //   Directory dir = await getApplicationDocumentsDirectory();
    //   File file =
    //   await File(dir.path + "/B9mah_Encrypt${Random().nextInt(1000)}.jpeg").create();
    //   await file.writeAsBytes(imgl.encodePng(img));
    //   print(file.path);
    //   PRO.setTempPath(file.path);
    //   await Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => ViewImage()));
    // }

    void BottomSheet(int num) => showModalBottomSheet(
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
                      color: BlackColor,
                    ),
                    title: Text('From the camera',
                        style: TextStyle(
                          color: BlackColor,
                        )),
                    onTap: () => {
                      if (num == 0)
                        {
                          Navigator.pop(context),
                          PRO.pickImage('plain', ImageSource.camera)
                        },
                      if (num == 1)
                        {
                          Navigator.pop(context),
                          PRO.pickImage('key', ImageSource.camera)
                        }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 0.5,
                      color: BlackColor.withOpacity(0.2),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      color: BlackColor,
                    ),
                    title: Text('From the Photo albums',
                        style: TextStyle(
                          color: BlackColor,
                        )),
                    onTap: () => {
                      if (num == 0)
                        {
                          Navigator.pop(context),
                          PRO.pickImage('plain', ImageSource.gallery)
                        },
                      if (num == 1)
                        {
                          Navigator.pop(context),
                          PRO.pickImage('key', ImageSource.gallery),
                        }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 0.5,
                      color: BlackColor.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'B9MAH DECRYPT',
            style: TextStyle(
              color: BlackColor,
              fontSize: 24,
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Encrypted Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BlackColor,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                      width: 260,
                      height: 260,
                      color: Colors.white.withOpacity(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              BottomSheet(0);
                            },
                            child: PRO.isImagePlainPicked
                                ? Image.file(File(PRO.getImagePlainPath),
                                    height: 240,
                                    width: 240,
                                    fit: BoxFit.contain)
                                : Icon(
                                    Icons.camera_alt,
                                    size: 65,
                                    color: BlackColor.withOpacity(.9),
                                  ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Key Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BlackColor,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                      width: 260,
                      height: 260,
                      color: Colors.white.withOpacity(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () => {
                              BottomSheet(1),
                            },
                            child: PRO.isImageKeyPicked
                                ? Image.file(File(PRO.getImageKeyPath),
                                    height: 240,
                                    width: 240,
                                    fit: BoxFit.contain)
                                : Icon(
                                    Icons.camera_alt,
                                    size: 65,
                                    color: BlackColor.withOpacity(.9),
                                  ),
                          ),
                        ],
                      )),
                  Container(
                    child: PRO.isImageKeyPicked && PRO.isImagePlainPicked
                        ? mainButton(
                            backGround: DecryptButtonColor.withOpacity(1),
                            fun: () {
                              PRO.run(context);
                            },
                            text: 'Decrypt',
                            textSize: 27.5,
                            icon: Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 36.0,
                            ),
                          )
                        : SizedBox(height: 10),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )),
      ),
    );
  }
}
