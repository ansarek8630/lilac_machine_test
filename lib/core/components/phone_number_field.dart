import 'dart:developer';

import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedCountryCode = '+91';

  List<String> countryCodes = [
    '+1', // United States / Canada
    '+44', // United Kingdom
    '+91', // India
    '+971', // United Arab Emirates
    '+61', // Australia
    '+81', // Japan
    '+49', // Germany
    '+33', // France
    '+86', // China
    '+92', // Pakistan
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

          child: Row(
            children: [
              Icon(Icons.phone_android, color: Colors.grey[700]),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: selectedCountryCode,
                underline: const SizedBox(),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                items: countryCodes.map((String code) {
                  return DropdownMenuItem<String>(value: code, child: Text(code));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountryCode = value ?? selectedCountryCode;
                    log("## ${selectedCountryCode}");
                  });
                  // Handle country code change
                },
              ),
              const VerticalDivider(width: 16, thickness: 1, color: Colors.grey),
              const Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile number',
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
