part of 'zoho_timer_bloc.dart';

@immutable
abstract class ZohoTimerEvent {}

class CheckInEvent extends ZohoTimerEvent {
  String time;

  CheckInEvent({
    required this.time,
  });
}


class CheckOutEvent extends ZohoTimerEvent {
  String time;
  //  Time timer;
  CheckOutEvent({
    required this.time,
  });
}
