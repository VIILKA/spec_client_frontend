import 'package:spec_client_app/features/auth/domain/entities/request/send_sms_req.dart';

abstract class SendMessageEvent {
  const SendMessageEvent();
}

class GetMessageEvent extends SendMessageEvent {
  final SendSMSReqEntity sendSMSReqEntity;
  const GetMessageEvent(this.sendSMSReqEntity);
}
