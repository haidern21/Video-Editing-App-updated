import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'package:video_editing_app/Utils/debug_utils.dart';

Future<void> initHiveDatabase({
  bool isDebug = false,
}) async {
  try {
    String path = await getDatabasePath(isDebug: isDebug);
    Hive.init(path);
  } on Exception catch (e, stack) {
    e.debugException(stack);
  }
}

Future<String> getDatabasePath({bool isDebug = false}) async {
  try {
    if (isIOS) {
      try {
        breadcrumb();
        final Directory directory = await getApplicationSupportDirectory();
        final String hiveDatabasePath = '${directory.path}/hive_database';
        // if (isDebug) {
        debug('Hive database path: `$hiveDatabasePath`', dev: 'SB');
        // }
        return hiveDatabasePath;
      } catch (e) {
        debug('ERROR While Getting $e');
        return '';
      }
    }

    // return '';
    // Get the application's document directory
    return getApplicationDocumentsDirectory().then((Directory directory) {
      breadcrumb();
      // added a sub-folder
      final String hiveDatabasePath = '${directory.path}/hive_database';

      if (isDebug) {
        debug('Hive database path: `$hiveDatabasePath`', dev: 'SB');
      }

      return hiveDatabasePath;
    });
  } on Exception catch (e, stack) {
    e.debugException(stack);
    return '';
  }
}

///           ***************       ////
///
/// These Functions are used to push and pull data from Hive Db.
extension BoxExtensions on Box<dynamic> {
  bool addDataMapToHiveDb({
    // key of data to for example if you want to push data with key '1' then pass '1' as key,
    required String key,
    // data to push in Hive Db
    required Map<String, dynamic>? data,
    bool isDebug = false,
  }) {
    try {
      if (data == null) {
        debug(
            'Trying to add NULL data: '
            '[box] `$name`, '
            '[key] `$key`',
            level: DiagnosticLevel.warning,
            dev: 'SB');

        // don't delete from the database just because this 1 call is empty
        return false;
      }

      if (isDebug) {
        debug(
            'Adding to Hive DB: '
            '[box] `$name`, '
            '[key] `$key`',
            dev: 'SB');
      }

      // You may use Add Operation , But thay store without Key ,
      // So we will use Put Operation to store data in Hive Db.
      put(key, data);
      return true;
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return false;
    }
  }

  /// NOTE: attempting to write null or empty will REMOVE the data
  Future<dynamic> readFromHiveDbJson({
    required String key,
    bool isDebug = false,
  }) async {
    try {
      if (isDebug) {
        debug('Reading [$name]: [key] `$key`: ', dev: 'SB');
      }

      return Hive.openBox(name).then((Box<dynamic> box) {
        if (box.containsKey(key) == false) {
          if (isDebug) {
            debug('No value in [$name]: [key] `$key`', dev: 'SB');
          }
          return null;
        }

        final dynamic data = box.get(key);

        if (data is! String) {
          if (isDebug) {
            debug(
                'Expected type String but got `${data.runtimeType}` from '
                '[$name]: [key] `$key`',
                dev: 'SB');
          }
          return null;
        }

        if (isDebug) {
          debug(
              'Decoding JSON from Hive DB '
              '[box] `$name`, [key] `$key`',
              dev: 'SB');
        }

        return json.decode(data);
      });

      //  as Map<String, dynamic> is too restictive
      //return data;
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return null;
    }
  }

  Future<bool> existsInHiveDb(
    String? key, {
    bool isDebug = false,
  }) async {
    try {
      if (key == null || key.isEmpty) {
        debug('Missing [key]', level: DiagnosticLevel.warning, dev: 'SB');
        return false;
      }

      if (isDebug) {
        debug(
            'Detecting in storage '
            '[box] `$name`, [key] `$key`',
            dev: 'SB');
      }

      return containsKey(key);

      // return readFromHiveDbJson(
      //   key: key!,
      //   //box: box,
      //   isDebug: isDebug,
      // ).then((dynamic value) {
      //   return value != null;
      // });
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return false;
    }
  }

  /// Delete Data from Hive Db.
  ///
  /// You will need to pass Key and BoxName to perform this operation.
  ///
  /// You may ask user for confirmation before deleting data from Hive Db.
  bool deleteFromHiveDb({
    required String key,
    bool isDebug = false,
  }) {
    try {
      if (isDebug) {
        debug(
            'Removing from Hive DB: '
            '[box] `$name`, [key] `$key`',
            dev: 'SB');
      }

      // nothing is returned from delete()
      delete(key);
      return true;
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return false;
    }
  }

  /// A FUNCTION TO GET DATA FROM HIVE DB
  ///
  /// NOTE: not used
  Map<String, dynamic>? getDataFromHiveDb({
    required String key,
    bool isDebug = false,
  }) {
    try {
      final dynamic data = get(key);
      if (data == null) {
        if (isDebug) {
          debug(
              'Data not found in Hive DB '
              '[box] `$name`, [key] `$key`',
              dev: 'SB');
        }
        return null;
      }

      return data as Map<String, dynamic>;

      ///Returns the value associated with the given [key]. If the key does not exist, null is returned.
      /// If [defaultValue] is specified, it is returned in case the key does not exist.
      // });
      // }); .
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return null;
    }
  }

  /// A FUNCTION TO GET ALL Keys and Values FROM HIVE DB
  ///
  Iterable<Map<String, dynamic>>? getAllDataFromHiveDb({
    bool isDebug = false,
  }) {
    try {
      final Map<dynamic, dynamic> data = toMap();
      if (data == null) {
        if (isDebug) {
          debug(
              'Data not found in Hive DB '
              '[box] `$name`',
              dev: 'SB');
        }
        return null;
      }

      return data.values.map((dynamic e) => e as Map<String, dynamic>);
    } on Exception catch (e, stack) {
      // don't error save to db in db files - could cause recursion
      e.debugException(stack, saveToDb: false);
      return null;
    }
  }

// Value Listener for listening to changes in Hive Db.

// valueListenerForContact({required String boxName}) {
//   return Hive.box(boxName).listenable();
// }

}

extension DatabaseCRUDExtensions on Box<dynamic> {
  Future<int> deleteDbBox({
    bool isDebug = false,
  }) async {
    try {
      if (isDebug) {
        breadcrumb(
            message: 'Clearing Hive Box: `$name`',
            level: DiagnosticLevel.warning,
            dev: 'SB');
      }

      // do the delete here
      return clear();
    } on Exception catch (e, stack) {
      e.debugException(stack);
      return 0;
    }
  }
}
