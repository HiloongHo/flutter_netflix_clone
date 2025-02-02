import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const VerticalIconButton(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(height: 2.0),
          Text(title, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
