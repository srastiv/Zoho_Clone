import 'dart:async';

class time{

  Timer? _timer;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  bool _isStarted = false;
  bool _isStopped = false;


  void handelStopWatch() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;
        if (_minute == 59) {
          _minute = 0;
          _hour++;
        } else {
          _minute++;
        }
      }
    });
  }

  void startTimer() {
    _isStarted = true;
    _isStopped = false;
    handelStopWatch();
  }

  void stopTimer() {
    if (_isStarted == true) {
      _isStarted = false;
      _isStopped = true;
      _timer!.cancel();
    }
  }

  void continueTimer() {
    _isStopped = false;
    _isStarted = true;
    handelStopWatch();
  }
}