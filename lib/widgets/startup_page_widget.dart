import 'package:flutter/material.dart';
import 'package:quon_sekai_idle/constants/colors.dart';

class StartupStartElevatedButton extends ElevatedButton {
  StartupStartElevatedButton({
    super.key,
    super.onPressed,
    super.child,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? foregroundColor,
  }) : super(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                padding ?? const EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundColor ?? startupPageButtonBackgroundColor),
            foregroundColor: MaterialStateProperty.all<Color>(
                foregroundColor ?? startupPageButtonForegroundColor),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );


}
