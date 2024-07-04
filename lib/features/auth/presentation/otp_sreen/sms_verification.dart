import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class VerificationCodeScreen extends StatefulWidget {
  final String phoneNumber;

  VerificationCodeScreen({required this.phoneNumber});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late Timer _timer;
  int _remainingTime = 120; // 2 минуты в секундах
  Color borderColor = Color.fromARGB(255, 209, 209, 209);
  bool showErrorMessage = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  void _resendCode() {
    setState(() {
      _remainingTime = 120;
      _startTimer();
    });
    // Здесь можно добавить логику для повторной отправки кода
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 150,
            alignment: Alignment.bottomCenter,
          ),
          margin: EdgeInsets.only(left: 50),
        ),
        backgroundColor: Palette.bgColor,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxHeight: 400),
          decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Введите код из СМС',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Мы отправили его на номер',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget
                      .phoneNumber, // Номер телефона полученный из phone input screen
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 60,
                    fieldHeight: 55,
                    enabledBorderColor: borderColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    //установите значение true для отображения в виде прямоугольника или false для отображения в виде тире
                    showFieldAsBox: true,
                    //
                    //запускается при вводе кода
                    onCodeChanged: (String code) {
                      //обрабатывать валидацию или проверки здесь
                    },
                    //
                    //запускается, когда каждое текстовое поле заполнено
                    onSubmit: (String verificationCode) {
                      if (verificationCode == '1111') {
                        setState(() {
                          borderColor = Colors.red;
                          showErrorMessage = true;
                        });
                        ;
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Верификация"),
                                content:
                                    Text('Введенный код: $verificationCode'),
                              );
                            });
                      }
                    },
                  ),
                ),

                showErrorMessage == true
                    ? Column(
                        children: [
                          SizedBox(height: 12.0),
                          Text(
                            'Код указан неверно',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 12.0),
                        ],
                      )
                    : SizedBox(height: 24.0),
                SizedBox(
                  width: 270,
                  child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(PersonalDataRoute());
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
                const SizedBox(height: 16.0),
                //  Таймер повторного отправления

                Center(
                  child: _remainingTime > 0
                      ? Text(
                          'Можно запросить поаторно через ${_formatTime(_remainingTime)}')
                      : TextButton(
                          onPressed: _resendCode,
                          child: const Text(
                            'Отправить код еще раз',
                            style: TextStyle(fontSize: 16, color: Palette.blue),
                          ),
                        ),
                ),
              ]),
        ),
      ),
    );
  }
}
