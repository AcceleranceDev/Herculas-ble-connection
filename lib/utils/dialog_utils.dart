import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static bool _isLoaderShowing = false;
  static bool _isAlertShowing = false;

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

  static showActionDialogBox(BuildContext context,
      {required Function() onPressed,
      required String message,
      String? hintMessage}) {
    if (_isAlertShowing) {
      hideAlert(context);
    }
    _isAlertShowing = true;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceAround,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                hintMessage ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () => hideAlert(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              onPressed: onPressed,
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  static hideAlert(BuildContext context) {
    if (!_isAlertShowing) {
      return;
    }
    _isLoaderShowing = false;
    return Navigator.pop(context);
  }
}
