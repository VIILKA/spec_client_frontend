// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CheckEmailScreen(email: args.email),
      );
    },
    ChooseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseScreen(),
      );
    },
    ConfirmEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmEmailScreen(),
      );
    },
    PersonalDataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalDataScreen(),
      );
    },
    PhoneInputRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneInputScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TestPage(),
      );
    },
    VerificationCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationCodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerificationCodeScreen(phoneNumber: args.phoneNumber),
      );
    },
  };
}

/// generated route for
/// [CheckEmailScreen]
class CheckEmailRoute extends PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(email: email),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const PageInfo<CheckEmailRouteArgs> page =
      PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({required this.email});

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{email: $email}';
  }
}

/// generated route for
/// [ChooseScreen]
class ChooseRoute extends PageRouteInfo<void> {
  const ChooseRoute({List<PageRouteInfo>? children})
      : super(
          ChooseRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmEmailScreen]
class ConfirmEmailRoute extends PageRouteInfo<void> {
  const ConfirmEmailRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalDataScreen]
class PersonalDataRoute extends PageRouteInfo<void> {
  const PersonalDataRoute({List<PageRouteInfo>? children})
      : super(
          PersonalDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalDataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneInputScreen]
class PhoneInputRoute extends PageRouteInfo<void> {
  const PhoneInputRoute({List<PageRouteInfo>? children})
      : super(
          PhoneInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneInputRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TestPage]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute({List<PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationCodeScreen]
class VerificationCodeRoute extends PageRouteInfo<VerificationCodeRouteArgs> {
  VerificationCodeRoute({
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationCodeRoute.name,
          args: VerificationCodeRouteArgs(phoneNumber: phoneNumber),
          initialChildren: children,
        );

  static const String name = 'VerificationCodeRoute';

  static const PageInfo<VerificationCodeRouteArgs> page =
      PageInfo<VerificationCodeRouteArgs>(name);
}

class VerificationCodeRouteArgs {
  const VerificationCodeRouteArgs({required this.phoneNumber});

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationCodeRouteArgs{phoneNumber: $phoneNumber}';
  }
}
