import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spec_client_app/features/auth/data/data_source/remote/send_sms_register_api_service.dart';
import 'package:spec_client_app/features/auth/data/repository/message_repository_impl.dart';
import 'package:spec_client_app/features/auth/domain/repository/response/message_rep.dart';
import 'package:spec_client_app/features/auth/domain/usecases/get_message_usecase.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton<SendSmsRegisterApiService>(
      SendSmsRegisterApiService(sl()));

  sl.registerSingleton<MessageRepository>(MessageRepositoryImpl(sl()));

  //UseCases

  sl.registerSingleton<GetMessageUsecase>(GetMessageUsecase(sl()));

  //Bloc

  sl.registerFactory<SendMessageBloc>(() => SendMessageBloc(sl()));
}
