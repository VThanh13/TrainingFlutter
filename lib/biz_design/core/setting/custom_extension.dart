import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CustomString on String {
  String capitalizeFirstLetter() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
    return this;
  }
}

extension CustomText on Text {
  Text toConfirmDialog() {
    return Text(
      data!,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xff0500FF),
      ),
    );
  }

  Text toDetailDialog() {
    return Text(
      data!,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.black87,
      ),
    );
  }
}

extension CustomDateTime on DateTime {
  String customDateTime() {
    return DateFormat.yMMMMd('en_US').format(this);
  }
}

extension CustomBuildContext on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;
}
