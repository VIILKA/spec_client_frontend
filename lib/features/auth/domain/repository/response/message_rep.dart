import 'package:spec_client_app/core/resoures/data_state.dart';
import 'package:spec_client_app/features/auth/domain/entities/request/send_sms_req.dart';
import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';

abstract class MessageRepository {
  Future<DataState<MessageEnt>> getMessage(SendSMSReqEntity sendSMSReqEntity);
}
