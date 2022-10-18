part of 'qr_scan_result_bloc.dart';

abstract class QrScanResultEvent extends Equatable {
  const QrScanResultEvent();

  @override
  List<Object> get props => [];
}

class QrScan_onInit_Event extends QrScanResultEvent {
  final barCodeRawValue;
  QrScan_onInit_Event(this.barCodeRawValue);
}
