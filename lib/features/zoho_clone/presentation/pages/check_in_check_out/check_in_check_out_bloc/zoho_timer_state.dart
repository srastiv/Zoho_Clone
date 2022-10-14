part of 'zoho_timer_bloc.dart';

@immutable
abstract class ZohoTimerState {}

class ZohoTimerInitialState extends ZohoTimerState {}

class ZohoTimerLoadedState extends ZohoTimerState {}

class ZohoTimerActiveState extends ZohoTimerState {}

class ZohoTimerPausedState extends ZohoTimerState {}

class ZohoTimerErrorState extends ZohoTimerState {
  String message;
  ZohoTimerErrorState(this.message);
}
