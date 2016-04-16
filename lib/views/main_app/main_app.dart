import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_input.dart';

import '../../services/user.dart';
import '../../services/database.dart';
import '../../cards/initiative_calculator/initiative_calculator.dart';
import '../../cards/output_view/output_view.dart';
import '../../components/app_card.dart';

@Component(selector: 'main-app',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html',
    directives: const [InitiativeCalculator, OutputView, AppCard],
    providers: const [User, Database]
)
class MainApp {
  final Logger _log;
  final User user;
  final Database _db;

  MainApp(Logger this._log, User this.user, Database this._db) {
    _log.info("$runtimeType()");
  }
}
