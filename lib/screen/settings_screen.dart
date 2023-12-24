import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/colors.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({required this.maxNumber,super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNum = 1000;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxNum = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Body(
                  maxNum: maxNum,
                ),
                _Footer(maxNum: maxNum, onSliderChanged: onSliderChanged, onButtonPressed: onButtonPressed,)
              ],
            ),
          ),
        ));
  }
  void onSliderChanged(double val) {
    setState(() {
      maxNum = val;
    });
    maxNum = val;
  }
  void onButtonPressed() {
    Navigator.of(context).pop(maxNum.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNum;

  const _Body({required this.maxNum, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNum.toInt(),)
    );
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double>? onSliderChanged;
  final double maxNum;
  final VoidCallback onButtonPressed;
  const _Footer({required this.maxNum,required this.onSliderChanged,required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNum,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
          child: Text(
            '저장!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
