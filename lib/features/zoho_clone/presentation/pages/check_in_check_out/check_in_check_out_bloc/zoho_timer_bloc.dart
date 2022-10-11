import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'zoho_timer_event.dart';
part 'zoho_timer_state.dart';

class ZohoTimerBloc extends Bloc<ZohoTimerEvent, ZohoTimerState> {
  ZohoTimerBloc() : super(ZohoTimerInitialState()) {
    on<ZohoTimerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
