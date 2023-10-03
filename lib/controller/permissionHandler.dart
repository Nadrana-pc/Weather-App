import 'package:permission_handler/permission_handler.dart';

void requestPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
  } else if (status.isDenied) {
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
