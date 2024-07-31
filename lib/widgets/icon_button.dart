import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final void Function() iconButtonFucntion;
  final IconData? buttonIcon;
  final String? data;
  const ButtonWithIcon(
      {super.key,
      required this.iconButtonFucntion,
      required this.buttonIcon,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: iconButtonFucntion,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            buttonIcon,
            size: 18,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            data!,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
