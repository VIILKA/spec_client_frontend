import 'package:equatable/equatable.dart';

class SendSMSReqEntity extends Equatable {
  final String? phone_number;
  final String? user_type;

  const SendSMSReqEntity({
    this.phone_number,
    this.user_type,
  });

  @override
  List<Object?> get props => [phone_number, user_type];
}
