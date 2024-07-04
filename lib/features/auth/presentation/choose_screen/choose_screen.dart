import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spec',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Palette.bgColor,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  alignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  margin: const EdgeInsets.only(top: 50),
                  child: const Column(children: [
                    Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Пожалуйста, укажите кто вы.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    SizedBox(
                      width: 270,
                      child: CustomElevatedButton(
                        customerType: 'Заказчик техники',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                        width: 270,
                        child: CustomElevatedButton(
                          customerType: 'Владелец техники',
                        )),
                    SizedBox(height: 16.0),
                    SizedBox(
                        width: 270,
                        child: CustomElevatedButton(
                          customerType: 'Грузчик',
                        )),
                  ]),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/choose_who.png',
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String customerType;

  const CustomElevatedButton({
    super.key,
    required this.customerType,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AutoRouter.of(context).push(const PhoneInputRoute());
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      ),
      child: Text(customerType),
    );
  }
}
