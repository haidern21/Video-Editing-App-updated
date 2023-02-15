import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';

/// For use when you dont' want to return null
const MapEntry<String?, Map<String?, dynamic>?> emptyMapEntry =
    MapEntry<String?, Map<String?, dynamic>?>(null, null);

extension BoxHelper on Box<dynamic> {
  /// return a strongly typed Map from dynamic
  Iterable<Map<String, dynamic>> toIterableMap() {
    try {
      return toMap()
          .map((dynamic key, dynamic value) {
            try {
              if (value is String) {
                debug(
                  'String found when Map expected '
                  'for [box] `$name` '
                  'and [key] `$key` '
                  'with [value] `$value`',
                );
                return emptyMapEntry;
              }

              return MapEntry<String, Map<String, dynamic>>(
                key.toString(),
                Map<String, dynamic>.from(value),
              );
            } on Exception catch (e, stack) {
              debug(
                'Got Error While Converting to Map : $e ',
                stackTrace: stack,
              );
              return emptyMapEntry;
            }
          })
          .values
          .whereType<Map<String, dynamic>>();
    } on Exception catch (e, stack) {
      debug(
        'Caught Exception Here While Converting to Map ',
        stackTrace: stack,
      );
      return <Map<String, dynamic>>{};
    }
  }
}

extension MapHelper on Map<dynamic, dynamic> {
  Map<String, dynamic>? getMapValue(
    String key,
  ) {
    try {
      if (this == null) {
        return null;
      }

      final dynamic value = this[key];
      if (value == null) {
        return null;
      }

      if (value is Map<String, dynamic>) {
        return value;
      }

      if (value is Map<dynamic, dynamic>) {
        return value._toStringKey();
      }

      return null;
    } on Exception catch (e, stack) {
      debug(
        'Got Error While Converting to Map : $e ',
        stackTrace: stack,
      );
      return null;
    }
  }

  /// use if you really want the key to be a string
  Map<String, dynamic>? _toStringKey() {
    try {
      if (this == null) {
        return null;
      }

      if (this is Map<String, dynamic>) {
        return this as Map<String, dynamic>?;
      }

      // convert the dynamic to a string
      final Map<String, dynamic> result = <String, dynamic>{};

      // https://stackoverflow.com/questions/62096723/how-to-convert-maps-keys-from-int-to-string-in-flutter
      forEach((dynamic key, dynamic value) {
        result.putIfAbsent(key.toString(), () => value);
      });

      return result;
    } on Exception catch (e, stack) {
      debug(
        'Got Error While Converting to Map : $e ',
        stackTrace: stack,
      );
      return null;
    }
  }
}
