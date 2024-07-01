import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';

part 'message_req_dto.g.dart';

@JsonSerializable()
class MessageDto extends MessageEnt {
  final String? message;
  MessageDto({
    this.message,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}
