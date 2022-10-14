import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoho_clone/dependency_injection.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho_entity.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/text_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/textstyle_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/check_in_check_out/check_in_check_out_bloc/zoho_timer_bloc.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/check_in_check_out/widgets/timer_display.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/history/timing_history_bloc/timer_history_bloc.dart';
import 'package:zoho_clone/timer.dart';

class CheckInCheckOut extends StatefulWidget {
  CheckInCheckOut({Key? key}) : super(key: key);

  @override
  State<CheckInCheckOut> createState() => _CheckInCheckOutState();
}

class _CheckInCheckOutState extends State<CheckInCheckOut> {


  // Future postDateTime({required String time}) async {
  //   CollectionReference docTime =
  //       FirebaseFirestore.instance.collection('checkIn');

  //   final zohotime = ZohoEntity(time: DateTime.now().toString());

  //   final json = {
  //     "checkIn": time,
  //   };
  //   await docTime.add(json);
  // }





  Timer? _timer;
  int _start = 60;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void stopTimer() {
    setState(() => _timer!.cancel());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
            color: kLightGrey,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.notifications_outlined,
            color: kLightGrey,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<ZohoTimerBloc> buildBody(BuildContext context) {
    bool isPressed = false;
    return BlocProvider(
      create: (_) => sl<ZohoTimerBloc>(),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: BlocBuilder<ZohoTimerBloc, ZohoTimerState>(
          builder: (context, state) {
            if (state is ZohoTimerInitialState) {
              return Container(
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
                        TimerDisplay(hourMinSec: Time().hour
                            //   hourMinSec: 0,
                            ),
                        const SizedBox(
                          child: Text(
                            " : ",
                            style: TextStyle(color: kWhite, fontSize: 20),
                          ),
                        ),
                        TimerDisplay(
                          hourMinSec: Time().minute,
                        ),
                        const SizedBox(
                          child: Text(
                            " : ",
                            style: TextStyle(color: kWhite, fontSize: 20),
                          ),
                        ),
                        TimerDisplay(
                          hourMinSec: _start,
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
                          primary: isPressed == false ? kRed : kGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            // Time().stopWatch;
                            // Time().startTimer;
                          });
                          startTimer;

                        //     postDateTime(time: DateTime.now().toString());

                          BlocProvider.of<ZohoTimerBloc>(context).add(
                              CheckInEvent(time: DateTime.now().toString()));
                          isPressed = !isPressed;
                        },
                        child: Text(
                          isPressed == false ? "Check-In" : "Check-Out",
                          style: kCheckInTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is TimerErrorState) {
              return const Center(
                child: Text(
                  "error state",
                  style: TextStyle(color: kRed),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "neither loaded nor initial state",
                  style: TextStyle(color: kRed),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
