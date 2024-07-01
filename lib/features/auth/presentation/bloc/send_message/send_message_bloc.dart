import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spec_client_app/core/resoures/data_state.dart';
import 'package:spec_client_app/features/auth/domain/usecases/get_message_usecase.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_event.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final GetMessageUsecase _getMessageUsecase;

  SendMessageBloc(this._getMessageUsecase) : super(const SendMessageLoading()) {
    on<GetMessage>(onGetArticles);
  }

  void onGetArticles(GetMessage event, Emitter<SendMessageState> emit) async {
    final dataState = await _getMessageUsecase();

    if (dataState is DataSuccess) {
      print(dataState.data!.message);

      emit(SendMessageDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(SendMessageError(dataState.error!));
    }
  }
}
