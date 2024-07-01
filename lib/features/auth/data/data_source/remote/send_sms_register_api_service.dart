import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spec_client_app/core/constants/api_constants.dart';
import 'package:spec_client_app/features/auth/data/dto/request/send_sms_req_dto.dart';
import 'package:spec_client_app/features/auth/data/dto/response/message_req_dto.dart';

part 'send_sms_register_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SendSmsRegisterApiService {
  factory SendSmsRegisterApiService(Dio dio) = _SendSmsRegisterApiService;

  @POST('/authentication/send-sms-register/')
  Future<HttpResponse<MessageDto>> getMessage(
      @Body() SendSMSReqDto sendSMSReqDto);
}

// class SendSmsRegisterApiService {
//   final Dio _dio;
//   const SendSmsRegisterApiService(this._dio);

//   Future<HttpResponse<MessageDto>> getMessage(
//       {required SendSMSReqDto sendSMSReqDto}) async {
//     final Response response = await _dio.post(
//         "http://185.237.96.190:8075/spec/api/v1/authentication/send-sms-register/",
//         data: SendSMSReqDto(
//                 phoneNumber: sendSMSReqDto.phoneNumber,
//                 userType: sendSMSReqDto.userType)
//             .toJson());

//     final MessageDto value = MessageDto.fromJson(response.data);
//     debugPrint(value.message);
//     final httpResponse = HttpResponse(value, response);
//     return httpResponse;
//   }
// }
