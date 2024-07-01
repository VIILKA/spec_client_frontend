// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';

abstract class SendMessageState extends Equatable {
  final MessageEnt? message;
  final DioException? error;

  const SendMessageState({
    this.message,
    this.error,
  });

  @override
  List<Object> get props => [message!, error!];
}

class SendMessageLoading extends SendMessageState {
  const SendMessageLoading();
}

class SendMessageDone extends SendMessageState {
  const SendMessageDone(MessageEnt message) : super(message: message);
}

class SendMessageError extends SendMessageState {
  const SendMessageError(DioException error) : super(error: error);
}
