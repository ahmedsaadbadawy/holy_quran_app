import 'package:flutter/material.dart';

void customSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.sizeOf(context).width / 2,
      content: Center(
          child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      )),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey[800],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}
