part of 'timer_history_bloc.dart';

@immutable
abstract class TimerHistoryState {}

class TimerHistoryInitial extends TimerHistoryState {}

class TimerHistoryLoadedState extends TimerHistoryState {
  List<ZohoModel> checkInList;
  List<ZohoModelOUT> checkOutList;

  TimerHistoryLoadedState({
    required this.checkInList,
    required this.checkOutList,
  });
}

class TimerErrorState extends TimerHistoryState {}
