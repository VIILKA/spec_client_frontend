import 'package:spec_client_app/features/auth/data/dto/request/send_sms_req_dto.dart';
import 'package:spec_client_app/features/auth/domain/entities/request/send_sms_req.dart';

extension ToEntitySMSExt on SendSMSReqDto {
  SendSMSReqEntity toEntity() =>
      SendSMSReqEntity(phone_number: phoneNumber, user_type: userType);
}

extension FromEntityExt on SendSMSReqEntity {
  SendSMSReqDto fromEntity() =>
      SendSMSReqDto(phoneNumber: phone_number ?? '', userType: user_type ?? '');
}
