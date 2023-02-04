import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        onPressed: widget.onPressed,
        padding: const EdgeInsets.symmetric(vertical: 8),
        splashColor: Theme.of(context).splashColor,
        textColor: Colors.black,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: widget.icon,
            ),
            Expanded(
              flex: 4,
              child: Text(widget.buttonName, textAlign: TextAlign.start),
            )
          ],
        ),
      ),
    );
  }
}
