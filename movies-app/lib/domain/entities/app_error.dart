// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final ErrorType errorType;
  const AppError(this.errorType);

  @override
  List<Object> get props => [errorType];
}

enum ErrorType {
  api,
  network,
  database,
  sharedPrefernces,
}
