import 'package:flutter/material.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/text_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/textstyle_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/widgets/timer_display.dart';

class CheckInCheckOut extends StatelessWidget {
  const CheckInCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kBlack,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: kLightGrey,
              child: Icon(
                Icons.person,
                color: kBlack,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            kHomeText,
          ],
        ),
        centerTitle: false,
        actions: const [
          Icon(
            Icons.search,
            color: kGrey,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.notifications_outlined,
            color: kGrey,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: kGrey,
            borderRadius: BorderRadius.circular(19),
          ),
          height: 350,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimerDisplay(
                    hourMinSec: 02,
                  ),
                  const SizedBox(
                    child: Text(
                      " : ",
                      style: TextStyle(color: kWhite, fontSize: 20),
                    ),
                  ),
                  TimerDisplay(
                    hourMinSec: 02,
                  ),
                  const SizedBox(
                    child: Text(
                      " : ",
                      style: TextStyle(color: kWhite, fontSize: 20),
                    ),
                  ),
                  TimerDisplay(
                    hourMinSec: 02,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: SizedBox(
                  height: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kLightestGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              kGeneralText,
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Check-In",
                    style: kCheckInTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
