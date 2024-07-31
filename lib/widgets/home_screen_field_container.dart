import 'package:flutter/material.dart';

class HomeScreenFieldContainer extends StatelessWidget {
  final String gridViewText;
  final Function(int index) gridViewContainerFunction;
  const HomeScreenFieldContainer(
      {super.key,
      required this.gridViewText,
      required this.gridViewContainerFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            gridViewText,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
