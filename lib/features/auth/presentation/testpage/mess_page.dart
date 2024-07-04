import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_bloc.dart';
import 'package:spec_client_app/features/auth/presentation/bloc/send_message/send_message_state.dart';

@RoutePage()
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MESSAGE'),
      ),
      body: _buildbody(),
    );
  }

  _buildbody() {
    return BlocBuilder<SendMessageBloc, SendMessageState>(
      builder: (context, state) {
        if (state is SendMessageLoading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is SendMessageError) {
          return Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is SendMessageDone) {
          return Container(
            child: Text('data'),
          );
        }
        return Container(
          child: Text('НИЧЕГО НЕ ПОЛУЧИЛОСЬ'),
        );
      },
    );
  }
}
