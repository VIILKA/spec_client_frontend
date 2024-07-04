import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class CheckEmailScreen extends StatelessWidget {
  final String email;
  CheckEmailScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    'assets/images/check_email.png',
                    width: 150,
                    alignment: Alignment.topCenter,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Проверьте почту',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'На адрес ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: email,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text:
                              ' отправлено письмо с ссылкой для подтверждения. Перейдите по ней, чтобы привязать почту.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        AutoRouter.of(context).push(ConfirmEmailRoute());
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
                        'Вернутся назад',
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
