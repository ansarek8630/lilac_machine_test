import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:japx/japx.dart';
import 'package:lilac_machine_test/data/models/get_otp.dart';

import '../models/otp_verified.dart';

class HttpServices {
  static var baseurl = "https://test.myfliqapp.com/api/v1";

  static Future getOtp(String phone) async {
    try {
      final response = await http.post(
          Uri.parse(
            "$baseurl/auth/registration-otp-codes/actions/phone/send-otp",
          ),
          body: jsonEncode({
            "data": {
              "type": "registration_otp_codes",
              "attributes": {"phone": phone}
            }
          }));
      if (response.statusCode == 200) {
        return getOtpFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future verifyOtp(int otp, String phone) async {
    try {
      final response = await http.post(
        Uri.parse(
          "$baseurl/auth/registration-otp-codes/actions/phone/verify-otp",
        ),
        body: jsonEncode({
          "data": {
            "type": "registration_otp_codes",
            "attributes": {
              "phone": phone,
              "otp": otp,
              "device_meta": {
                "type": "web",
                "device-name": "HP Pavilion 14-EP0068TU",
                "device-os-version": "Linux x86_64",
                "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
                "browser_version": "112.0.2",
                "user-agent":
                    "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
                "screen_resolution": "1600x900",
                "language": "en-GB"
              }
            }
          }
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> rawJson = jsonDecode(response.body);
        final Map<String, dynamic> flattenedJson = Japx.decode(rawJson);
        return flattenedJson['data'];
      } else {
        log("OTP verification failed: ${response.statusCode}");
        log("Body: ${response.body}");
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }

  static Future getMessages() async {
    try {
      final response = await http.get(
        Uri.parse(
          "$baseurl/auth/registration-otp-codes/actions/phone/verify-otp",
        ),
        headers: {
          'Authorization':
              'Bearer 1043|qhRPFLPEnnKqQ6eOJi6DCThMDsTvE2GEk7hjWsEgf445f1a4',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> rawJson = jsonDecode(response.body);
        final Map<String, dynamic> flattenedJson = Japx.decode(rawJson);
        return otpVerifiedFromJson(flattenedJson['data']);
      } else {
      log("OTP verification failed: ${response.statusCode}");
        log("Body: ${response.body}");
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }
}
