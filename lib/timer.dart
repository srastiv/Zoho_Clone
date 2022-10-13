import 'dart:async';















































class Time{

  Timer? timer;
  int hour = 0;
  int minute = 0;
  int seconds = 0;
  bool isStarted = false;
  bool isStopped = false;


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
    isStopped = false;
    stopWatch();
  }

  void stopTimer() {
    if (isStarted == true) {
      isStarted = false;
      isStopped = true;
      timer!.cancel();
    }
  }

  void continueTimer() {
    isStopped = false;
    isStarted = true;
    stopWatch();
  }
}