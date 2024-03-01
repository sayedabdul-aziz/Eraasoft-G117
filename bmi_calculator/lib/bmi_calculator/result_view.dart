import 'package:bmi_calculator/bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = TextStyle(
        color: AppColors.white, fontSize: 33, fontWeight: FontWeight.bold);
    TextStyle style2 = TextStyle(color: AppColors.white, fontSize: 14);

// Severe Thinness	< 16
// Moderate Thinness	16 - 17
// Mild Thinness	17 - 18.5
// Normal	18.5 - 25
// Overweight	25 - 30
// Obese Class I	30 - 35
// Obese Class II	35 - 40
// Obese Class III	> 40

    String getClassification() {
      if (result < 16) {
        return 'Severe Thinness';
      } else if (result >= 18.5 && result < 25) {
        return 'Normal';
      } else {
        return 'Obese Class III';
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getClassification(), style: style2),
              Text(result.toStringAsFixed(2), style: style1),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Re-CALCULATE')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
