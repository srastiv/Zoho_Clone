import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/history/timing_history_bloc/timer_history_bloc.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerHistoryBloc, TimerHistoryState>(
      builder: (context, state) {
        if (state is TimerHistoryInitial) {
          BlocProvider.of<TimerHistoryBloc>(context)
              .add(FetchTimerHistoryEvent());

          return const Scaffold(
            backgroundColor: kBlack,
            body: Center(
              child: Text(
                "initial state",
                style: TextStyle(color: kRed),
              ),
            ),
          );
        }
        if (state is TimerHistoryLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBlack,
              title: Column(
                children: [
                  Text(
                    DateFormat.yMMMMd()
                        .format(DateTime.parse(state.checkInList[0].time))
                        .toString(),
                    style: const TextStyle(color: kLightestGrey),
                  ),
                  const Text(
                    "Present",
                    style: TextStyle(color: kLightestGrey, fontSize: 15),
                  ),
                ],
              ),
            ),
            backgroundColor: kBlack,
            body: ListView.builder(
              itemCount: state.checkInList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: kGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      DateFormat.yMd()
                                          .format(DateTime.parse(
                                              state.checkInList[index].checkIn))
                                          .toString(),
                                      style:
                                          const TextStyle(color: kLightestGrey),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.phone,
                                      color: kLightestGrey,
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat.jm()
                                      .format(DateTime.parse(
                                          state.checkInList[index].checkIn))
                                      .toString(),
                                  //  "check-IN time",
                                  style: const TextStyle(
                                      color: kGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Pune",
                                  style: TextStyle(
                                      color: kLightestGrey,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      // state.checkOutList[index].checkOut
                                      //    ?
                                           DateFormat.yMd()
                                              .format(DateTime.parse(state
                                                  .checkOutList[index]
                                                  .checkOut))
                                              .toString(),
                                         // : "...",
                                      style:
                                          const TextStyle(color: kLightestGrey),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.location_on,
                                      color: kLightestGrey,
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormat.jm()
                                      .format(DateTime.parse(
                                          state.checkOutList[index].checkOut))
                                      .toString(),
                                  style: const TextStyle(
                                      color: kRed, fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Pune",
                                  style: TextStyle(
                                      color: kLightestGrey,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          );
        } else if (state is TimerErrorState) {
          return const Scaffold(
            body: Center(
              child: Text(
                "error state",
                style: TextStyle(color: kRed),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
