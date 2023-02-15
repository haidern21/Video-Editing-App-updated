import 'package:hive_flutter/hive_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/data/hive/hive_constant.dart';
import 'package:video_editing_app/app/data/hive/hive_io.dart';

Future<void> captureSignUpData(Map<String, dynamic> data) async {
  try {
    final Box<dynamic> userBox = await Hive.openBox('userBox');

    /// First check if we already have some data in the box
    var value = await userBox.get(userSignUpKeyName);
    // .then((value) {
    if (value != null) {
      debug('Value $value');

      var map = Map<String, dynamic>.from(value);

      /// If we have some data then merge the data
      data.addAll(map);
      // data.addAll({
      //   'account_type': 'business',
      // });
    }
    // });
    await userBox.put(
      userSignUpKeyName,
      data,
    );
  } on Exception catch (e, stack) {
    e.debugException(stack);
  }
}

Future<void> captureAccountTypeSignUpData(String accountType) async {
  try {
    final Box<dynamic> userBox = await Hive.openBox('userBox');
    await userBox.put(
      userSignUpKeyName,
      {
        'role': accountType,
      },
    );
  } on Exception catch (e, stack) {
    e.debugException(stack);
  }
}

Future<Map<String, dynamic>?> getTempSignUpDataFromStorage() async {
  breadcrumb();
  try {
    final Box<dynamic> userBox = await Hive.openBox('userBox');
    var data = userBox.get(
      userSignUpKeyName,
    );
    log('Data $data');
    return Map<String, dynamic>.from(data);
  } on Exception catch (e, stack) {
    e.debugException(stack);
    return null;
  }
}
