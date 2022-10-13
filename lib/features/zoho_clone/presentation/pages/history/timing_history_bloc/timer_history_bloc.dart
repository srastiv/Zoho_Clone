import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/history/widgets/get_chek_history.dart';
part 'timer_history_bloc_event.dart';
part 'timer_history_bloc_state.dart';

class TimerHistoryBloc extends Bloc<TimerHistoryEvent, TimerHistoryState> {
  TimerHistoryBloc() : super(TimerHistoryInitial()) {
    on<FetchTimerHistoryEvent>((event, emit) async {

      var checkIn = await getCheckInHistory();
      var checkOut = await getCheckOutHistory();

      emit(
        TimerHistoryLoadedState(
          checkInList: checkIn,
          checkOutList: checkOut,
        ),
      );
    });
  }
}
