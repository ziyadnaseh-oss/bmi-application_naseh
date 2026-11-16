import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xFF4C4F5E),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}