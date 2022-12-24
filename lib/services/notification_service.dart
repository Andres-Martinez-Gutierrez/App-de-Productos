import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> notificationKey =
      GlobalKey<ScaffoldMessengerState>();

  static notificationShowSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
    notificationKey.currentState!.showSnackBar(snackBar);
  }
}
