// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:spec_client_app/core/resoures/data_state.dart';
import 'package:spec_client_app/core/usecase/usecase.dart';
import 'package:spec_client_app/features/auth/domain/entities/response/message_ent.dart';
import 'package:spec_client_app/features/auth/domain/repository/response/message_rep.dart';

class GetMessageUsecase implements UseCase<DataState<MessageEnt>, void> {
  final MessageRepository _messageRepository;
  GetMessageUsecase(this._messageRepository);

  @override
  Future<DataState<MessageEnt>> call({void params}) {
    return _messageRepository.getMessage();
  }
}
