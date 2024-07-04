import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});
  final String email = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Palette.bgColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              constraints: BoxConstraints(maxHeight: 440),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/confirmed_email.png',
                    width: 150,
                    alignment: Alignment.topCenter,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Почта подтверждена',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Вы привязали почту ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'email@example.ru',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              ' к аккаунту. Вы можете изменить ее в личном кабинете в любое время.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // AutoRouter.of(context)
                        //     .push(IdVerificationRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor: Palette.blue,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(
                          color: Palette.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IdVerificationRoute {
  const IdVerificationRoute();
}
