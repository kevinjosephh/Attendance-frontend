part of 'qr_scan_result_bloc.dart';

abstract class QrScanResultState extends Equatable {
  const QrScanResultState();

  @override
  List<Object> get props => [];
}

class QrScanResultInitial extends QrScanResultState {}

class Qr_NOT_Detected_State extends QrScanResultState {}

class Qr_Detected_and_Right_State extends QrScanResultState {}

class Qr_Detected_and_Wrong_State extends QrScanResultState {}
