import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';

class CustomTitleButton extends StatefulWidget {
  final Function() onPressed;
  final String buttonName;
  final IconData icon;
  final Color primaryColor;
  final Color secondayColor;
  const CustomTitleButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.icon,
    this.primaryColor = Colors.deepPurple,
    this.secondayColor = Colors.white,
  });

  @override
  State<CustomTitleButton> createState() => _CustomTitleButtonState();
}

class _CustomTitleButtonState extends State<CustomTitleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: StaticVal.size_15, horizontal: StaticVal.size_8),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(StaticVal.size_8),
            side: BorderSide(
                color: widget.secondayColor, width: StaticVal.size_3_5)),
        onPressed: widget.onPressed,
        elevation: StaticVal.size_3_5,
        padding: const EdgeInsets.symmetric(
            vertical: StaticVal.size_10, horizontal: StaticVal.size_4),
        splashColor: Theme.of(context).splashColor,
        textColor: widget.secondayColor,
        color: widget.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: StaticVal.size_4.toInt(),
              child: Icon(widget.icon, size: StaticVal.size_50),
            ),
            Expanded(
              flex: StaticVal.size_2.toInt(),
              child: Text(widget.buttonName,
                  style: const TextStyle(fontSize: StaticVal.size_22_5),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
