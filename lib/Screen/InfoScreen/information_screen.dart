import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_encryption/Screen/InfoScreen/AckScreen.dart';
import 'package:image_encryption/Screen/InfoScreen/MoreInfoScreen.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/components.dart';

import '../../Sharad/GetEmail.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    email(){
      OpenEmail.openEmail(
        toEmail: 'NawafAlkhadidi@gmail.com',
        subject: 'B9mah App',
      );
    }



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'About US',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.black,
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
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Container(
                              child: Column(children: [
                                Image.asset('images/logo2.png'),
                              ])),
                        )
                      ),
                      SizedBox(height: 30),
                      ///MoreInfo Button 1
                      infoBoutton(
                        Title: "More information",
                        SubTitle:"More information about this app" ,
                        icon: Icon(Icons.info , size: 38 , color: Colors.black,),
                        Fun: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MoreinfoScreen()));
                        },
                      ),
                      ///Contact Button 2
                      infoBoutton(
                        Title: "Contact the developer",
                        SubTitle:"Contact me directly through email" ,
                        icon: Icon(Icons.email , size: 38 , color: Colors.black,),
                        Fun: (){
                          email();
                        },
                      ),
                      ///Acknowledge Button 3
                      infoBoutton(
                        Title: "Acknowledgements",
                        SubTitle:"thanks to services used in this app" ,
                        icon: Icon(Icons.thumb_up , size: 38 , color: Colors.black,),
                        Fun: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AckScreen()));
                        },
                      ),
                      ///TextVersio
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 40),
                        child: Text("Version: 1.0",
                          style: TextStyle(
                          fontSize: 27,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      ///NameOfDev
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("© 2021 Nawaf Alkhadidi | Yasser Bamogabel"),
                            ],
                          ),
                        ),
                    ],
                  ),
                ))));
  }
}