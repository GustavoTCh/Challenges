import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

class HttpService {
  static final String _storageUrl =
      "https://firebasestorage.googleapis.com/v0/b/shopping-car-d5ed6.appspot.com/o/";

  static String settingUrlStorage({@required String path}) {
    return '$_storageUrl${Uri.encodeComponent(path)}.png?alt=media';
  }
}
