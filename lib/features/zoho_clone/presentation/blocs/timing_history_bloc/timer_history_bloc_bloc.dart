import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_history_bloc_event.dart';
part 'timer_history_bloc_state.dart';

class TimerHistoryBlocBloc extends Bloc<TimerHistoryBlocEvent, TimerHistoryBlocState> {
  TimerHistoryBlocBloc() : super(TimerHistoryBlocInitial()) {
    on<TimerHistoryBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
