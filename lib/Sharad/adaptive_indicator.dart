import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveIndicator extends StatelessWidget {
  String os;

//constructor
  AdaptiveIndicator({
    @required this.os,
  });

  @override
  Widget build(BuildContext context) {
    print(this.os);
    if (this.os == 'android')
      return CircularProgressIndicator();
    else
      return CupertinoActivityIndicator();
  }
}
