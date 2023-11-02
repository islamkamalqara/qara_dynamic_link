

abstract class AppEvent {}

class GetPublicScanData extends AppEvent{
String qr_value;
GetPublicScanData({required this.qr_value});
}
