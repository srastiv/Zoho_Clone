import 'package:flutter/material.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/textstyle_constants.dart';

class TimerDisplay extends StatelessWidget {
  int hourMinSec = 0;
  TimerDisplay({Key? key, required int hourMinSec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          hourMinSec.toString(),
          style: kHourTextStyle,
        ),
      ),
    );
  }
}
