import 'package:auto_route/auto_route.dart';
import 'package:spec_client_app/features/auth/presentation/choose_screen/choose_screen.dart';
import 'package:spec_client_app/features/auth/presentation/confirm_screen/check_email.dart';
import 'package:spec_client_app/features/auth/presentation/confirm_screen/confirm_email.dart';
import 'package:spec_client_app/features/auth/presentation/otp_sreen/phone_input_screen.dart';
import 'package:spec_client_app/features/auth/presentation/otp_sreen/sms_verification.dart';
import 'package:spec_client_app/features/auth/presentation/personal_data_screen/personal_data_screen.dart';
import 'package:spec_client_app/features/auth/presentation/splash_screen/splash_screan.dart';
import 'package:spec_client_app/features/auth/presentation/testpage/mess_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(page: ChooseRoute.page),
        AutoRoute(page: PhoneInputRoute.page),
        AutoRoute(page: VerificationCodeRoute.page),
        AutoRoute(page: PersonalDataRoute.page),
        AutoRoute(page: CheckEmailRoute.page),
        AutoRoute(page: ConfirmEmailRoute.page),
        AutoRoute(page: TestRoute.page, initial: true)
      ];
}
