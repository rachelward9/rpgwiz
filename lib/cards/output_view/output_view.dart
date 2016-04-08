import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:firebase/firebase.dart' as FB;

import '../../services/database.dart';

@Component(selector: 'output-view',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'output_view.html'
)
class OutputView {
  final Logger _log;
  final Database _db;

  List<Map> messages = [];

  OutputView(Logger this._log, Database this._db) {
    _log.info("$runtimeType()");

    _db.fbOutput.onChildAdded.listen((FB.Event event) {
      messages.add(event.snapshot.val());
    });
  }

  void clear() {
    _log.info("$runtimeType()::clear()");

    messages.clear();
    _db.clearOutput();
  }
}