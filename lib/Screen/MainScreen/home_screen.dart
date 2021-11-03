import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/EnryptScreen/encrypt_screen.dart';
import 'package:image_encryption/Screen/infoScreen/information_screen.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:provider/provider.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:image_encryption/Screen/DecryptScreen/decrypt_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var PRO = Provider.of<ImagesProvider>(context);

    void encrypt() async {
      PRO.clear();
      PRO.setTypeOfAction('Encrypt');
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => EncryptScreen()));
    }
    void decrypt() async {
      PRO.clear();
      PRO.setTypeOfAction('Decrypt');
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DecryptScreen()));
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // backgroundColor: Color(0xffA9DBEE),
          appBar: homeAppBar(),
          body: Container(
            // width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:  const BoxDecoration(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Container(
                          child: Image.asset('images/logo2.png')),
                    ),
                  ),
                  mainButton(
                    backGround: EncryptButtonColor,
                      text: 'Encrypt',
                      textSize: 27.5,
                      icon: Icon(Icons.lock, color: Colors.white, size: 36.0,),
                    fun: (){encrypt();},
                  ),
                  mainButton(
                    backGround: DecryptButtonColor.withOpacity(1),
                      fun: (){decrypt();},
                      text: 'Decrypt',
                      textSize: 27.5,
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                        size: 36.0,
                      ),),
                  mainButton(
                      fun: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InformationScreen(),),);},
                      text: 'About us',
                      textSize: 26.5,
                      icon: Icon(Icons.group, color: Colors.white, size: 36.0,
                  ), backGround: AboutButtonColor.withOpacity(1)),
                ],
              ),
            ),
          ),
        ));
  }

  AppBar homeAppBar() {
    return AppBar(
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
    );
  }
}
