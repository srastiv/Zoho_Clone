import 'package:equatable/equatable.dart';

class Zoho extends Equatable {
  
  final DateTime time;
  Zoho({required this.time});
  List<Object> get props => [time];
  
}
