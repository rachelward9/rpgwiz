import 'dart:async';

import 'package:angular2/core.dart';
import 'package:logging/logging.dart';
import 'package:firebase/firebase.dart';

import 'user.dart';

@Injectable()
class Database {
  static const String FIREBASE_PATH = "https://rpgwiz.firebaseio.com";
  static const String FIREBASE_OUTPUT_PATH = "$FIREBASE_PATH/output";

  final Logger _log;
  final User _user;

  final Firebase fbOutput = new Firebase("$FIREBASE_OUTPUT_PATH");

  Database(Logger this._log, User this._user) {
    _log.info("$runtimeType()");
  }

  Future output(String data) async {
    _log.info("$runtimeType::output() -- ${_user.characterName}: $data");

    await fbOutput.push()..set({
      "name": _user.characterName,
      "message": data
    });
  }

  void clearOutput() {
    fbOutput.remove();
  }
}