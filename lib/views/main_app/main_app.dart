import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import '../../cards/initiative_calculator/initiative_calculator.dart';

@Component(selector: 'main-app',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html',
    directives: const [InitiativeCalculator]
)
class MainApp {
  final Logger _log;

  MainApp(Logger this._log) {
    _log.info("$runtimeType()");
  }
}
