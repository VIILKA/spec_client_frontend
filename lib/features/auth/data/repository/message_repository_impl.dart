import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spec_client_app/core/resoures/data_state.dart';
import 'package:spec_client_app/features/auth/data/data_source/remote/send_sms_register_api_service.dart';
import 'package:spec_client_app/features/auth/data/mappers/message_map.dart';
import 'package:spec_client_app/features/auth/domain/entities/request/send_sms_req.dart';
import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';
import 'package:spec_client_app/features/auth/domain/repository/response/message_rep.dart';

class MessageRepositoryImpl implements MessageRepository {
  final SendSmsRegisterApiService _sendSmsRegisterApiService;

  MessageRepositoryImpl(this._sendSmsRegisterApiService);

  @override
  Future<DataState<MessageEnt>> getMessage(
      SendSMSReqEntity sendSMSReqEntity) async {
    try {
      print(sendSMSReqEntity.toString());
      final httpResponse = await _sendSmsRegisterApiService
          .getMessage(sendSMSReqEntity.fromEntity());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(DataSuccess(httpResponse.data.message));
        return DataSuccess(httpResponse.data);
      } else {
        print(DioException(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions));
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}
