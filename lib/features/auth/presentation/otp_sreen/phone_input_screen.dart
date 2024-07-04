import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneRegExp = RegExp(r"^\+[0-9]{11}$");
  String phoneNumber = '+7';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 150,
            alignment: Alignment.topCenter,
          ),
          // margin: const EdgeInsets.only(left: 50),
        ),
        backgroundColor: Palette.bgColor,
      ),
      body: SafeArea(
        child: Container(
          // width: double.infinity,
          // color: Palette.bgColor,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxHeight: 400),
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Введите номер телефона',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Мы отправим на него СМС с кодом\nдля авторизации.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            initialValue: phoneNumber,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '+7',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            onChanged: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите номер телефона';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (phoneRegExp.hasMatch(phoneNumber)) {
                                AutoRouter.of(context).push(
                                    VerificationCodeRoute(
                                        phoneNumber: phoneNumber));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Не коректный номер')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Palette.white,
                              backgroundColor: Palette.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            ),
                            child: const Text(
                              'Продолжить',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to terms and conditions
                            print('Open terms and conditions');
                          },
                          child: Text(
                              'Нажимая "Продолжить", вы принимаете\nПользовательсткое соглашение'),
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
