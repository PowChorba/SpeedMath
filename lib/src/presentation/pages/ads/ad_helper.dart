import 'dart:io';

class AdHelper {
  static String get fullScreenAdUnitId {
    if (Platform.isIOS) {
      return 'ca-app-pub-8561798323577837/6744581095';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-8561798323577837~4610755236';
    } else {
      throw UnsupportedError('Unsopported');
    }
  }
}
