// To parse this JSON data, do
//
//     final getOtp = getOtpFromJson(jsonString);

import 'dart:convert';

GetOtp getOtpFromJson(String str) => GetOtp.fromJson(json.decode(str));

String getOtpToJson(GetOtp data) => json.encode(data.toJson());

class GetOtp {
    int data;
    bool status;
    String message;

    GetOtp({
        required this.data,
        required this.status,
        required this.message,
    });

    factory GetOtp.fromJson(Map<String, dynamic> json) => GetOtp(
        data: json["data"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "message": message,
    };
}
