import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String buttonName;
  final Icon icon;
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.icon});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: StaticVal.size_15,
      ),
      child: MaterialButton(
        onPressed: widget.onPressed,
        elevation: StaticVal.size_2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(StaticVal.size_10)),
        padding: const EdgeInsets.symmetric(vertical: StaticVal.size_10),
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: StaticVal.size_2.toInt(),
              child: widget.icon,
            ),
            Expanded(
              flex: StaticVal.size_4.toInt(),
              child: Text(
                widget.buttonName,
                style: const TextStyle(fontSize: StaticVal.size_20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
