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
    if (this.os == 'Android') return CircularProgressIndicator();
    else
    return CupertinoActivityIndicator();
  }
}
