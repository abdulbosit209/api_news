

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.buttonItem, required this.text, required this.onTab,
  }) : super(key: key);

  final bool buttonItem;
  final String text;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: (buttonItem == true) ? Colors.black : Colors.grey,
          foregroundColor: (buttonItem == true) ? Colors.white : Colors.grey
              .shade100,
        ),
        child: Text(text));
  }
}