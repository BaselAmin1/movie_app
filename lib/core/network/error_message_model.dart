// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  bool success;

  ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json['statusCode'],
        statusMessage: json['statusMessage'],
        success: json['sucess']);
  }

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
