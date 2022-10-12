import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'timer_history_bloc_event.dart';
part 'timer_history_bloc_state.dart';

class TimerHistoryBloc extends Bloc<TimerHistoryEvent, TimerHistoryState> {
  TimerHistoryBloc() : super(TimerHistoryInitial()) {
    on<TimerHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
