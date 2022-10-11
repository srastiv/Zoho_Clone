import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

class ZohoModel extends Zoho {
  ZohoModel({
    required String amOrPM,
    required DateTime time,
  }) : super(amOrPM: amOrPM, time: time);

  factory ZohoModel.fromJson(Map<String, dynamic> json) {
    return ZohoModel(
      amOrPM: json['amOrPM'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amOrPM": amOrPM,
      "time": time,
    };
  }
}
