part of 'zoho_timer_bloc.dart';

@immutable
abstract class ZohoTimerState {}

class ZohoTimerInitialState extends ZohoTimerState {}

class ZohoTimerActiveState extends ZohoTimerState {}

class ZohoTimerInactiveState extends ZohoTimerState {}

class ZohoTimerErrorState extends ZohoTimerState {
  String message;
  ZohoTimerErrorState(this.message);
}
