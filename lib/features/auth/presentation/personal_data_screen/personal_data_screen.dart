import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spec_client_app/core/routes/router.dart';
import 'package:spec_client_app/utils/constants.dart';

@RoutePage()
class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  String _username = '';
  String _email = '';
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _isFormFilled = false;

  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Palette.bgColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Личные данные',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Имя',
                      style: labelTextStyle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userNameController,
                    style: TextStyle(color: Palette.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Имя пользователя',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => _username = value!,
                    onChanged: (value) {
                      setState(() {
                        _isFormFilled =
                            _username.isNotEmpty && _email.isNotEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Почта',
                      style: labelTextStyle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'email@example.ru',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => _email = value!,
                    onChanged: (value) {
                      setState(() {
                        _isFormFilled = emailController.text.isNotEmpty &&
                            userNameController.text.isNotEmpty;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailRegExp.hasMatch(emailController.text)) {
                          AutoRouter.of(context).push(
                              CheckEmailRoute(email: emailController.text));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Не коректная почта')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor:
                            _isFormFilled ? Colors.blue : Colors.grey,
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
                        style: TextStyle(color: Palette.white),
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
