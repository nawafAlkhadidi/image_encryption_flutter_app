// import 'dart:ffi';
import 'dart:io';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

class ViewImage extends StatefulWidget {
  final plainPP;
  final keyPP;

  const ViewImage({Key key, this.plainPP, this.keyPP}) : super(key: key);
  @override
  State<ViewImage> createState() => _ViewImageState(this.plainPP, this.keyPP);
}

class _ViewImageState extends State<ViewImage> {
  ImagesProvider PROFULL = ImagesProvider();

  String tPath = 'null';

  _ViewImageState(plainPP, keyPP);

  Future<void> doAction() async {
    await Future.delayed(Duration(milliseconds: 900));
    String p = await PROFULL.runAfter(this.widget.plainPP, this.widget.keyPP);

    setState(() {
      tPath = p;
    });
  }

  @override
  void initState() {
    doAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    saveImage() async {
      StatusAlert.show(
        context,
        duration: Duration(seconds: 4),
        title: 'Saved',
        subtitle: 'The image has been saved successfully',
        configuration: IconConfiguration(icon: Icons.done),
        backgroundColor: WhiteColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      );
      await GallerySaver.saveImage(this.tPath); // save in Gallery
      await File(this.tPath).delete(); // delete temp
      await PRO.clear();
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      await Navigator.pushReplacement(context, route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'B9MAH ENCRYPTION',
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
                  height: 30,
                ),
                Text(
                  'Encrypted Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BlackColor,
                    fontSize: 25,
                  ),
                ),
                this.tPath == "null"
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.white.withOpacity(0.5),
                        child: Container( height: 5,width: 5, child: CircularProgressIndicator()))
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.file(
                          File(this.tPath),
                        ),
                      ),
                mainButton(
                    text: 'Save',
                    textSize: 25,
                    textColors: WhiteColor,
                    icon: Icon(
                      Icons.add,
                      size: 42,
                      color: WhiteColor,
                    ),
                    backGround: Colors.lightBlue,
                    fun: saveImage)
              ],
            ),
          )),
    );
  }
}
