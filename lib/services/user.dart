import 'package:angular2/core.dart';
import 'package:logging/logging.dart';

@Injectable()
class User {
  final Logger _log;

  String characterName;

  User(Logger this._log) {
    _log.info("$runtimeType()");
  }
}