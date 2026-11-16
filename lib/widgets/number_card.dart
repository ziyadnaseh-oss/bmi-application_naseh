import 'package:flutter/material.dart';
import 'round_button.dart';

class NumberCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon1;
  final IconData icon2;
  final VoidCallback onAdd;
  final VoidCallback onSub;

  const NumberCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon1,
    required this.icon2,
    required this.onAdd,
    required this.onSub,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1F33),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70)),
            Text('$value', style: const TextStyle(fontSize: 40, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(icon: icon1, onTap: onSub),
                const SizedBox(width: 15),
                RoundButton(icon: icon2, onTap: onAdd),
              ],
            ),
          ],
        ),
      ),
    );
  }
}