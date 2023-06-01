import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static bool _isLoaderShowing = false;

  static showLoader(BuildContext context) {
    if (_isLoaderShowing) {
      hideLoader(context);
    }
    _isLoaderShowing = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }

  static hideLoader(BuildContext context) {
    if (!_isLoaderShowing) {
      return;
    }
    _isLoaderShowing = false;
    return Navigator.pop(context);
  }
}
