import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spec_client_app/core/resoures/data_state.dart';
import 'package:spec_client_app/features/auth/data/data_source/remote/send_sms_register_api_service.dart';
import 'package:spec_client_app/features/auth/data/dto/request/send_sms_req_dto.dart';
import 'package:spec_client_app/features/auth/data/dto/response/message_req_dto.dart';
import 'package:spec_client_app/features/auth/domain/repository/response/message_rep.dart';

class MessageRepositoryImpl implements MessageRepository {
  final SendSmsRegisterApiService _sendSmsRegisterApiService;

  MessageRepositoryImpl(this._sendSmsRegisterApiService);

  @override
  Future<DataState<MessageDto>> getMessage() async {
    try {
      SendSMSReqDto sendSMSReqDto =
          SendSMSReqDto(phoneNumber: '9998482468246', userType: 'customer');
      final httpResponse =
          await _sendSmsRegisterApiService.getMessage(sendSMSReqDto);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
