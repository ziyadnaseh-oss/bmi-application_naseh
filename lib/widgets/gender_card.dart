import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1D1F33) : const Color(0xFF111328),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}