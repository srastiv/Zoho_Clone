part of 'zoho_timer_bloc.dart';

@immutable
abstract class ZohoTimerEvent {}

class CheckInEvent extends ZohoTimerEvent{}

class CheckOutEvent extends ZohoTimerEvent{}