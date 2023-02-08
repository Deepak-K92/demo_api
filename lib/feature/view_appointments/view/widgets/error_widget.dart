import 'package:flutter/material.dart';

import '../../../../static/strings.dart';
import '../../../../static/styles.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String message;
  final IconData? icon;
  const ErrorWidgetCustom({super.key, required this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon != null
              ? Icon(
            icon,
            color: Colors.purple,
            size: StaticVal.size_250,
            shadows: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: StaticVal.size_2)
            ],
          )
              : Container(),
          icon != null? const Padding(padding: EdgeInsets.only(top: StaticVal.size_30)):Container(),
          Text(message,textAlign: TextAlign.center, style: errorHandling2)
        ],
      ),
    );
  }
}