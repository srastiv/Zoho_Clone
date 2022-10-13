import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/get_check_in_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/get_check_out_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/post_check_in_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/post_check_out_time.dart';
import 'package:zoho_clone/timer.dart';
part 'zoho_timer_event.dart';
part 'zoho_timer_state.dart';

class ZohoTimerBloc extends Bloc<ZohoTimerEvent, ZohoTimerState> {
  final GetCheckInTimeUsecase getCheckInTimeUsecase;
  final GetCheckOutTimeUsecase getCheckOutTimeUsecase;
  final PostCheckInTimeUsecase postCheckInTimeUsecase;
  final PostCheckOutTimeUsecase postCheckOutTimeUsecase;

  ZohoTimerBloc(
      {required this.getCheckInTimeUsecase,
      required this.getCheckOutTimeUsecase,
      required this.postCheckInTimeUsecase,
      required this.postCheckOutTimeUsecase})
      : super(ZohoTimerInitialState()) {
    on<CheckInEvent>((event, emit) async {
      await postCheckInTimeUsecase.repository.postCheckInTime(DateTime.now());
      await getCheckInTimeUsecase.repository.getCheckInTime();
      await getCheckOutTimeUsecase.repository.getCheckOutTime();

      emit(ZohoTimerLoadedState());
    });

    on<CheckOutEvent>((event, emit) async {
      await postCheckOutTimeUsecase.repository.postCheckOutTime(DateTime.now());
      await getCheckInTimeUsecase.repository.getCheckInTime();
      await getCheckOutTimeUsecase.repository.getCheckOutTime();

      emit(ZohoTimerLoadedState());
    });
  }
}
