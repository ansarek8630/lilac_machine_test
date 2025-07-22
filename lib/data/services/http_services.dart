import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lilac_machine_test/data/models/get_otp.dart';

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
}
