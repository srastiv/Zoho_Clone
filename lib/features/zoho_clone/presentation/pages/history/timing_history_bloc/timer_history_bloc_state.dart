part of 'timer_history_bloc_bloc.dart';

@immutable
abstract class TimerHistoryState {}

class TimerHistoryInitial extends TimerHistoryState {}

class TimerHistoryLoadedState extends TimerHistoryState{}

class TimerErrorState extends TimerHistoryState{}