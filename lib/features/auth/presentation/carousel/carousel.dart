import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spec_client_app/features/auth/presentation/carousel/carousel_model.dart';
import 'package:spec_client_app/utils/constants.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController();
  int currentIndex = 0;
  Timer? _timer;
  double _progress = 0.0;
  final int duration = 5;
  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startProgress() {
    _progress = 0.0;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.1 / duration;
        if (_progress >= 1.0) {
          _progress = 0.0;
          timer.cancel();
          if (currentIndex < contents.length - 1) {
            _controller.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        }
      });
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    _startProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.orange,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: List.generate(contents.length, (i) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: LinearProgressIndicator(
                  value: i == currentIndex
                      ? _progress
                      : (i < currentIndex ? 1.0 : 0.0),
                  backgroundColor: Colors.white30,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          }),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: contents.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: 33, top: 11, left: 20, right: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                      ],
                    ),
                    Text(
                      contents[index].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(250),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                contents[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Пропустить',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          '${index + 1} из ${contents.length}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          'Продолжить',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
