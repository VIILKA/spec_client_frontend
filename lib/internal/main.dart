import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/features/auth/domain/entities/request/send_sms_req.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_bloc.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_event.dart';
import 'package:spec_client_app/internal/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    final SendSMSReqEntity sendSMSReqEntity =
        SendSMSReqEntity(phone_number: '32462435643', user_type: 'customer');
    return BlocProvider<SendMessageBloc>(
      create: (context) => sl()..add(GetMessageEvent(sendSMSReqEntity)),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: "SF-Pro-Display"),
        ),
      ),
    );
  }
}
