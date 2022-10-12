part of 'zoho_timer_bloc.dart';

@immutable
abstract class ZohoTimerEvent {}

class CheckInEvent extends ZohoTimerEvent {
  DateTime time;

  CheckInEvent({
    required this.time,
  });
}

class CheckOutEvent extends ZohoTimerEvent {
  DateTime time;
  //  Time timer;
  CheckOutEvent({
    required this.time,
  });
}
