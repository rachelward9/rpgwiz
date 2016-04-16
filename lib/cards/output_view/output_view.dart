import 'dart:html';

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

    _db.fbOutput.onChildRemoved.listen((FB.Event event) {
      if (messages.isNotEmpty) {
        messages.clear();
      }
    });
  }

  void clear(MouseEvent event) {
    _log.info("$runtimeType()::clear()");

    if (event.altKey) {
      _db.clearOutput();
    }
  }
}