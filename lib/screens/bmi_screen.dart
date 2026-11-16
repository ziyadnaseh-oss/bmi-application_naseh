import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/number_card.dart';
import 'result_screen.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double height = 160;
  int weight = 60;
  int age = 18;

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  void showResult() {
    double bmi = calculateBMI();
    String status;

    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi < 25) {
      status = 'Normal';
    } else if (bmi < 30) {
      status = 'Overweight';
    } else {
      status = 'Obese';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(bmi: bmi, status: status),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text('BMI Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderCard(
                    title: 'MALE',
                    icon: Icons.male,
                    isSelected: isMale,
                    onTap: () => setState(() => isMale = true),
                  ),
                  GenderCard(
                    title: 'FEMALE',
                    icon: Icons.female,
                    isSelected: !isMale,
                    onTap: () => setState(() => isMale = false),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: boxStyle(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      '${height.toInt()} CM',
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Slider(
                      value: height,
                      min: 40,
                      max: 300,
                      activeColor: Colors.pinkAccent,
                      onChanged: (value) => setState(() => height = value),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  NumberCard(
                    title: 'WEIGHT',
                    value: weight,
                    icon1: Icons.remove,
                    icon2: Icons.add,
                    onAdd: () => setState(() => weight++),
                    onSub: () => setState(() => weight--),
                  ),
                  NumberCard(
                    title: 'AGE',
                    value: age,
                    icon1: Icons.remove,
                    icon2: Icons.add,
                    onAdd: () => setState(() => age++),
                    onSub: () => setState(() => age--),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                onPressed: showResult,
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxStyle() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 50, 55, 85),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
