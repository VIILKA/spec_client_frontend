// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSMSReqDto _$SendSMSReqDtoFromJson(Map<String, dynamic> json) =>
    SendSMSReqDto(
      phoneNumber: json['phone_number'] as String,
      userType: json['user_type'] as String,
    );

Map<String, dynamic> _$SendSMSReqDtoToJson(SendSMSReqDto instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'user_type': instance.userType,
    };
