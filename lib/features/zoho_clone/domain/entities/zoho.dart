import 'package:equatable/equatable.dart';

class Zoho extends Equatable {
  final String amOrPM;
  final DateTime time;

  Zoho({required this.amOrPM, required this.time});

  List<Object> get props => [amOrPM, time];
  
}
