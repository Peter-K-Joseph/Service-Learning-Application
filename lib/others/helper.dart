import 'package:flutter/material.dart';

class AlertingServices {
  var icons = {
    "success": Icons.check_circle,
    "error": Icons.error,
    "warning": Icons.warning,
    "info": Icons.info,
  };

  var colors = {
    "success": Colors.green,
    "error": Colors.red,
    "warning": Colors.orange,
    "info": Colors.blue,
  };

  alertingMesseger(
    BuildContext context,
    String type,
    String title,
    String content,
    icon,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 10,
        width: 500,
        content: Container(
          padding: const EdgeInsets.all(6),
          height: 100,
          decoration: BoxDecoration(
            color: colors[type],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: [
                Icon(
                  ((icon == null) ? icons[type] : icon),
                  color: Colors.white,
                  size: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(content),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
