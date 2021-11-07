import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';

class AckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Acknowledgements',
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Container(
                  child: const Text(
                    'This chapter will introduce the major parts of this project, namely, the encryption and decryption scheme, security analysis, '
                    'the design of the system using use case diagram for representing the system functionality, '
                    'and the activity and sequence diagram for representing the flow of data in the intended system.'
                    ' The chapter will end with the logical design of the layout and the GUI of the system.',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                    textAlign: TextAlign.justify,
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
