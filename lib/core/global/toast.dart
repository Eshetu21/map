import 'package:fluttertoast/fluttertoast.dart';
import 'package:map/core/theme/app_pallet.dart';

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: primaryColor,
    textColor: whiteColor,
    timeInSecForIosWeb: 2,
    fontSize: 16,
  );
}

