// To parse this JSON data, do
//
//     final otpVerified = otpVerifiedFromJson(jsonString);

import 'dart:convert';

OtpVerified otpVerifiedFromJson(String str) => OtpVerified.fromJson(json.decode(str));

String otpVerifiedToJson(OtpVerified data) => json.encode(data.toJson());

class OtpVerified {
    Data data;

    OtpVerified({
        required this.data,
    });

    factory OtpVerified.fromJson(Map<String, dynamic> json) => OtpVerified(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    String id;
    String type;
    String name;
    String username;
    String email;
    DateTime dateOfBirth;
    String phone;
    String gender;
    String address;
    bool isActive;
    int coinBalance;
    String customerCode;
    bool isPremiumCustomer;
    int profileCompletionPercentage;
    String preferredGender;
    String selfieVerificationImagePath;
    String selfieVerificationVideoPath;
    DateTime selfieVerificationUploadedAt;
    int remainingSwipeLimit;
    DateTime resetSwipeLimitAt;
    int remainingSuperLikeLimit;
    DateTime resetSuperLikeLimitAt;
    int remainingFlashMessageLimit;
    DateTime resetFlashMessageLimitAt;
    String currentLocation;
    String currentLatitude;
    String currentLongitude;
    int heightInCm;
    String relationshipStatusName;
    String religionName;
    String drinkingHabitName;
    String smokingHabitName;
    String sexualOrientationName;
    String educationalQualificationName;
    String nativeLanguageName;
    String occupationName;
    String filterPassportModeLocation;
    String filterPassportModeLatitude;
    String filterPassportModeLongitude;
    bool isRealGiftsAccepted;
    bool isReceivingPushNotifications;
    bool isReceivingFlashMessages;
    bool isReadReceiptsEnabled;
    String profilePhotoUrl;
    String square100ProfilePhotoUrl;
    String square300ProfilePhotoUrl;
    String square500ProfilePhotoUrl;
    int age;
    AuthStatus authStatus;

    Data({
        required this.id,
        required this.type,
        required this.name,
        required this.username,
        required this.email,
        required this.dateOfBirth,
        required this.phone,
        required this.gender,
        required this.address,
        required this.isActive,
        required this.coinBalance,
        required this.customerCode,
        required this.isPremiumCustomer,
        required this.profileCompletionPercentage,
        required this.preferredGender,
        required this.selfieVerificationImagePath,
        required this.selfieVerificationVideoPath,
        required this.selfieVerificationUploadedAt,
        required this.remainingSwipeLimit,
        required this.resetSwipeLimitAt,
        required this.remainingSuperLikeLimit,
        required this.resetSuperLikeLimitAt,
        required this.remainingFlashMessageLimit,
        required this.resetFlashMessageLimitAt,
        required this.currentLocation,
        required this.currentLatitude,
        required this.currentLongitude,
        required this.heightInCm,
        required this.relationshipStatusName,
        required this.religionName,
        required this.drinkingHabitName,
        required this.smokingHabitName,
        required this.sexualOrientationName,
        required this.educationalQualificationName,
        required this.nativeLanguageName,
        required this.occupationName,
        required this.filterPassportModeLocation,
        required this.filterPassportModeLatitude,
        required this.filterPassportModeLongitude,
        required this.isRealGiftsAccepted,
        required this.isReceivingPushNotifications,
        required this.isReceivingFlashMessages,
        required this.isReadReceiptsEnabled,
        required this.profilePhotoUrl,
        required this.square100ProfilePhotoUrl,
        required this.square300ProfilePhotoUrl,
        required this.square500ProfilePhotoUrl,
        required this.age,
        required this.authStatus,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
        isActive: json["is_active"],
        coinBalance: json["coin_balance"],
        customerCode: json["customer_code"],
        isPremiumCustomer: json["is_premium_customer"],
        profileCompletionPercentage: json["profile_completion_percentage"],
        preferredGender: json["preferred_gender"],
        selfieVerificationImagePath: json["selfie_verification_image_path"],
        selfieVerificationVideoPath: json["selfie_verification_video_path"],
        selfieVerificationUploadedAt: DateTime.parse(json["selfie_verification_uploaded_at"]),
        remainingSwipeLimit: json["remaining_swipe_limit"],
        resetSwipeLimitAt: DateTime.parse(json["reset_swipe_limit_at"]),
        remainingSuperLikeLimit: json["remaining_super_like_limit"],
        resetSuperLikeLimitAt: DateTime.parse(json["reset_super_like_limit_at"]),
        remainingFlashMessageLimit: json["remaining_flash_message_limit"],
        resetFlashMessageLimitAt: DateTime.parse(json["reset_flash_message_limit_at"]),
        currentLocation: json["current_location"],
        currentLatitude: json["current_latitude"],
        currentLongitude: json["current_longitude"],
        heightInCm: json["height_in_cm"],
        relationshipStatusName: json["relationship_status_name"],
        religionName: json["religion_name"],
        drinkingHabitName: json["drinking_habit_name"],
        smokingHabitName: json["smoking_habit_name"],
        sexualOrientationName: json["sexual_orientation_name"],
        educationalQualificationName: json["educational_qualification_name"],
        nativeLanguageName: json["native_language_name"],
        occupationName: json["occupation_name"],
        filterPassportModeLocation: json["filter_passport_mode_location"],
        filterPassportModeLatitude: json["filter_passport_mode_latitude"],
        filterPassportModeLongitude: json["filter_passport_mode_longitude"],
        isRealGiftsAccepted: json["is_real_gifts_accepted"],
        isReceivingPushNotifications: json["is_receiving_push_notifications"],
        isReceivingFlashMessages: json["is_receiving_flash_messages"],
        isReadReceiptsEnabled: json["is_read_receipts_enabled"],
        profilePhotoUrl: json["profile_photo_url"],
        square100ProfilePhotoUrl: json["square100_profile_photo_url"],
        square300ProfilePhotoUrl: json["square300_profile_photo_url"],
        square500ProfilePhotoUrl: json["square500_profile_photo_url"],
        age: json["age"],
        authStatus: AuthStatus.fromJson(json["auth_status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "username": username,
        "email": email,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "gender": gender,
        "address": address,
        "is_active": isActive,
        "coin_balance": coinBalance,
        "customer_code": customerCode,
        "is_premium_customer": isPremiumCustomer,
        "profile_completion_percentage": profileCompletionPercentage,
        "preferred_gender": preferredGender,
        "selfie_verification_image_path": selfieVerificationImagePath,
        "selfie_verification_video_path": selfieVerificationVideoPath,
        "selfie_verification_uploaded_at": selfieVerificationUploadedAt.toIso8601String(),
        "remaining_swipe_limit": remainingSwipeLimit,
        "reset_swipe_limit_at": resetSwipeLimitAt.toIso8601String(),
        "remaining_super_like_limit": remainingSuperLikeLimit,
        "reset_super_like_limit_at": resetSuperLikeLimitAt.toIso8601String(),
        "remaining_flash_message_limit": remainingFlashMessageLimit,
        "reset_flash_message_limit_at": resetFlashMessageLimitAt.toIso8601String(),
        "current_location": currentLocation,
        "current_latitude": currentLatitude,
        "current_longitude": currentLongitude,
        "height_in_cm": heightInCm,
        "relationship_status_name": relationshipStatusName,
        "religion_name": religionName,
        "drinking_habit_name": drinkingHabitName,
        "smoking_habit_name": smokingHabitName,
        "sexual_orientation_name": sexualOrientationName,
        "educational_qualification_name": educationalQualificationName,
        "native_language_name": nativeLanguageName,
        "occupation_name": occupationName,
        "filter_passport_mode_location": filterPassportModeLocation,
        "filter_passport_mode_latitude": filterPassportModeLatitude,
        "filter_passport_mode_longitude": filterPassportModeLongitude,
        "is_real_gifts_accepted": isRealGiftsAccepted,
        "is_receiving_push_notifications": isReceivingPushNotifications,
        "is_receiving_flash_messages": isReceivingFlashMessages,
        "is_read_receipts_enabled": isReadReceiptsEnabled,
        "profile_photo_url": profilePhotoUrl,
        "square100_profile_photo_url": square100ProfilePhotoUrl,
        "square300_profile_photo_url": square300ProfilePhotoUrl,
        "square500_profile_photo_url": square500ProfilePhotoUrl,
        "age": age,
        "auth_status": authStatus.toJson(),
    };
}

class AuthStatus {
    String accessToken;
    String tokenType;
    bool is2FaConfiguredByUser;
    bool is2FaVerifiedByUser;
    bool isEmailVerificationRequired;

    AuthStatus({
        required this.accessToken,
        required this.tokenType,
        required this.is2FaConfiguredByUser,
        required this.is2FaVerifiedByUser,
        required this.isEmailVerificationRequired,
    });

    factory AuthStatus.fromJson(Map<String, dynamic> json) => AuthStatus(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        is2FaConfiguredByUser: json["is_2fa_configured_by_user"],
        is2FaVerifiedByUser: json["is_2fa_verified_by_user"],
        isEmailVerificationRequired: json["is_email_verification_required"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "is_2fa_configured_by_user": is2FaConfiguredByUser,
        "is_2fa_verified_by_user": is2FaVerifiedByUser,
        "is_email_verification_required": isEmailVerificationRequired,
    };
}
