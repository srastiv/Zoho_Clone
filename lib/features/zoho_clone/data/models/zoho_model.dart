import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

class ZohoModel extends Zoho {
  ZohoModel({
    required DateTime time,
  }) : super(time: time);

  factory ZohoModel.fromJson(Map<String, dynamic> json) {
    return ZohoModel(
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "time": time,
    };
  }
}
