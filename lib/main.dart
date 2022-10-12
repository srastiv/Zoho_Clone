import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/bottom_navigation.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/check_in_check_out/check_in_check_out_bloc/zoho_timer_bloc.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/history/timing_history_bloc/timer_history_bloc_bloc.dart';
import 'package:zoho_clone/firebase_options.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<ZohoTimerBloc>(
          create: (context)=> GetIt.instance<ZohoTimerBloc>(),
        ),
        BlocProvider<TimerHistoryBloc>(
          create: (BuildContext context) => TimerHistoryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: BottomNav(),
      ),
    );
  }
}
