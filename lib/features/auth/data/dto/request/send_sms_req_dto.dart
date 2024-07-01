import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_sms_req_dto.g.dart';

@JsonSerializable()
class SendSMSReqDto extends Equatable {
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "user_type")
  final String userType;

  const SendSMSReqDto({
    required this.phoneNumber,
    required this.userType,
  });

  @override
  List<Object?> get props => [phoneNumber, userType];

  factory SendSMSReqDto.fromJson(Map<String, dynamic> json) =>
      _$SendSMSReqDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SendSMSReqDtoToJson(this);
}
