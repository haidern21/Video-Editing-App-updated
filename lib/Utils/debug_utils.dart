import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Filterable helper for developers
///
/// - [appendMilliseconds]  OPTIONAL - Default true - NOTE: if off then logs (< 1 sec) will be rolled up
/// - [showStack]           OPTIONAL - Defailt false - Hide most of the stack track in the console
///
Future<void> debug(
  String? debugMessage, {
  String? dev,
  StackTrace? stackTrace,
  //Frame? stackFrame,
  DiagnosticLevel level = DiagnosticLevel.info,
  DateTime? logTime,
  //Exception? error,
  bool showLogTime = false,
  bool appendMilliseconds = false,
  bool showCaller = false,
  bool showParentCaller = false,
  bool showCounter = true,
  bool showStack = true,
  bool isToDo = false,
  bool isBreadcrumb = false,
  bool skipDebugFrames = false,
  bool? saveToDb,
  bool skipConsoleEnableCheck = false,
  String? levelEmoji,
}) async {
  try {
    Logger().d(debugMessage);
  } on Exception catch (e, stack) {
    inspect(e);
    debugPrint(e.toString());
    debugPrint(stack.toString());
    return;
  }
}

/// skip infos
bool isLoggableLevel(DiagnosticLevel level) {
  try {
    return level != DiagnosticLevel.off &&
        level != DiagnosticLevel.hidden &&
        level != DiagnosticLevel.hint &&
        level != DiagnosticLevel.info &&
        level != DiagnosticLevel.summary;
  } on Exception catch (e, stack) {
    inspect(e);
    debugPrint(e.toString());
    debugPrint(stack.toString());
    return false;
  }
}

const List<String> _ignoreList = <String>[
  'debug',
  '_debug',
  'breadcrumb',
  'todo',
  'sendToCrashlytics',
  'Crashlytics',
  'getDisplayCaller',
  'getFrameCaller',
];

const String debugEmojiBreadcrumb = '👋';

// ref: https://emojipedia.org/information/
const Map<DiagnosticLevel, String> debugEmojiMap = <DiagnosticLevel, String>{
  // https://emojipedia.org/wavy-dash/
  DiagnosticLevel.off: '⏳',
  // https://emojipedia.org/information/
  DiagnosticLevel.info: '👍',
  // https://emojipedia.org/warning/
  DiagnosticLevel.warning: '⚠️',
  // https://emojipedia.org/light-bulb/
  DiagnosticLevel.hint: '💡',
  // https://emojipedia.org/no-entry/
  DiagnosticLevel.error: '⛔',
};

const Map<DiagnosticLevel, String> debugShortNameMap =
    <DiagnosticLevel, String>{
  DiagnosticLevel.off: 'off',
  DiagnosticLevel.info: 'inf',
  DiagnosticLevel.warning: 'warn',
  DiagnosticLevel.hint: 'hint',
  DiagnosticLevel.error: 'err',
};

// https://www.kindacode.com/article/flutter-how-to-colorize-debug-console-logs/
const Map<DiagnosticLevel, String> _debugColorMap = <DiagnosticLevel, String>{
  /* Some commonly used ANSI escape codes:
    Black:   \x1B[30m
    White:   \x1B[37m
    Red:     \x1B[31m
    Green:   \x1B[32m
    Yellow:  \x1B[33m
    Magenta: \u001b[35m
    Blue:    \x1B[34m
    Cyan:    \x1B[36m

    Reset:   \x1B[0m
  */
  DiagnosticLevel.off: '\x1B[32m', // Green:   \x1B[32m
  // don't use BLUE to differentiate from flutter messages
  DiagnosticLevel.info: '\x1B[36m', // Cyan:    \x1B[36m
  DiagnosticLevel.warning: ' \x1B[33m', //Yellow:  \x1B[33m
  DiagnosticLevel.hint: ' \x1B[32m', //Green:   \x1B[32m
  DiagnosticLevel.error: '\x1B[31m', // Red:     \x1B[31m
};

/// Overload opf [debug] t
Future<void> breadcrumb({
  String? message,
  String? dev,
  StackTrace? stackTrace,
  DateTime? logTime,
  //Exception? error,
  bool showLogTime = true,
  DiagnosticLevel level = DiagnosticLevel.hint,
  //bool appendMilliseconds = false,
  // bool prefixEllipsis = false,
}) async {
  try {
    //message ??= $ellipsis'

    debug(
      // use with ellipsis if necessary, to spot breadcrumbs in the debug console
      message, // ' $ellipsis',
      dev: dev,
      // use the caller
      stackTrace: stackTrace ?? StackTrace.current,
      //  StackTrace.current,
      level: level,
      logTime: logTime,
      //error: error,
      showLogTime: showLogTime,
      //appendMilliseconds: appendMilliseconds,
      //showCaller: true,
      isBreadcrumb: true,
      levelEmoji: debugEmojiBreadcrumb,
    );
  } on Exception catch (e, stack) {
    debugPrint(e.toString());
    debugPrint(stack.toString());
    return;
  }
}

/// Case-insensitive lookup in [DiagnosticLevel.values]
DiagnosticLevel? findDiagnosticLevel(String value) {
  try {
    if (value.isEmpty) {
      return null;
    }

    value = value.toLowerCase();
    // if (DiagnosticLevel.values.byName(value).containsKey(value)) {
    //   return _DiagnosticLevelMap[value];
    // }

// https://stackoverflow.com/questions/27673781/enum-from-string
    return DiagnosticLevel.values.byName(value);
  } on Exception catch (e, stack) {
    e.debugException(stack);
    return null;
  }
}

/// some notes for devs
///
/// NOTE: check screen size until first displaying something
/// Called from app_layou.dart (the main screen)
///

extension StringUtils on String {
  /// prefix every line with something
  String multiLinePrefix(
    //String value,
    String insert, {
    bool prefixEmptyStrings = false,
  }) {
    try {
      if (insert.isEmpty) {
        // nothing to insert
        return this;
      }

      if (isEmpty) {
        if (prefixEmptyStrings) {
          return insert;
        }

        return '';
      }

      return insert + replaceAll('\n', '\n$insert');
    } on Exception catch (e, stack) {
      e.debugException(stack);
      return '';
    }
  }
}

extension ExceptionExtensions on Exception {
  /// - [reason]   OPTIONAL - E.g  'a non-fatal error'

  Future<void> debugException(
    StackTrace? stackTrace, {
    String? reason,
    String? dev,
    DiagnosticLevel level = DiagnosticLevel.error,
    //Object? flutterException,
    bool? isSendingToCrashlytics,
    bool saveToDb = true,
    bool isDebug = false,
  }) async {
    try {
      inspect('StakeTrace $stackTrace');

      debug(
        reason != null ? '$reason\n' : '',
        level: level,
        stackTrace: stackTrace,
        //error: error,
        dev: dev,
        saveToDb: saveToDb,
      );
      return;
    } on Exception catch (e, stack) {
      inspect(e);
      inspect(stack);
      debugPrint(e.toString());
      debugPrint(stack.toString());
      return;
    }
  }
}
