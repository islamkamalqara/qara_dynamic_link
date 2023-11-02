
import 'package:web_firebase_app/base/network/config.dart';
import 'package:web_firebase_app/base/network/network_util.dart';
import 'package:web_firebase_app/data/model/publicScanModel.dart';

class PublicScanRepository{

  Future<PublicScanModel?> getPublicScanData({required String qr_value}) async {
    print("11");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    print("url  : ${baseUrl + "scan/publicScan?qrCode=${qr_value}"}");
    return NetworkUtil.internal().post(
        PublicScanModel(),"https://be-test.dev.qaraservices.net/scan/publicScan?qrCode=${qr_value}",
        headers: headers
    );
  }
}
final publicScanRepository = PublicScanRepository();