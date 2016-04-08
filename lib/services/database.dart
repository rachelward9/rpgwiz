import 'package:angular2/core.dart';
import 'package:logging/logging.dart';

import 'user.dart';

@Injectable()
class Database {
  final Logger _log;
  final User _user;

  Database(Logger this._log, User this._user) {
    _log.info("$runtimeType()");
  }

  void output(String data) {
    _log.info("$runtimeType::output() -- ${_user.characterName}: $data");
  }
}