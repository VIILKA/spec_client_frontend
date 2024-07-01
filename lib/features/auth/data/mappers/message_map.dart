import 'package:spec_client_app/features/auth/data/dto/response/message_req_dto.dart';
import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';

extension ToEntitySMSExt on MessageDto {
  MessageEnt toEntity() => MessageEnt(message: message);
}

extension FromEntityExt on MessageEnt {
  MessageDto fromEntity() => MessageDto(message: message ?? '');
}
