import 'dart:async';

enum TimeProperties { hour, minute, second }

class Time {
  Timer? timer;
  int hour = 1;
  int minute = 24;
  int seconds = 20;
  bool isStarted = false;
  bool isPaused = false;

  void stopWatch() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds < 59) {
        seconds++;
      } else if (seconds == 59) {
        seconds = 0;
        if (minute == 59) {
          minute = 0;
          hour++;
        } else {
          minute++;
        }
      }
    });
  }

  void startTimer() {
    isStarted = true;
    isPaused = false;
    stopWatch();
  }

  void stopTimer() {
    if (isStarted == true) {
      isStarted = false;
      isPaused = true;
      timer!.cancel();
    }
  }

  void continueTimer() {
    isPaused = false;
    isStarted = true;
    stopWatch();
  }
}
