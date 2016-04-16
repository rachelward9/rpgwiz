import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';

@Component(selector: 'app-card',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'app_card.html',
    styleUrls: const ["../styles/fonts.css"]
)
class AppCard {
  final Logger _log;

  AppCard(Logger this._log) {
    _log.info("$runtimeType()");
  }
}