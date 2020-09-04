import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(radius: 15,)
            : CircularProgressIndicator(),
      ),
    );
  }
}
