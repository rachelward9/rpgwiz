import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer_elements/paper_dropdown_menu.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_icon_button.dart';

import '../../directives/paper_input_value_dir.dart';
import '../../directives/paper_checkbox_checked_dir.dart';
import '../../directives/paper_menu_selected_dir.dart';
import '../../pipes/pad_left_plus.dart';
import '../../services/database.dart';
import '../../models/operand.dart';
import '../../models/calculated_entry.dart';

@Component(selector: 'initiative-calculator',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'initiative_calculator.html',
    directives: const [
      PaperInputValueDirective,
      PaperCheckboxCheckedDirective,
      PaperMenuSelectedDirective
    ],
    pipes: const [PadLeftPlus]
)
class InitiativeCalculator {
  final Logger _log;
  final Database _db;

  Operand initRoll = new Operand("Initiative Roll", value: null, active: true);
  Operand dexMod = new Operand("DEX Modifier", value: null, active: true);
  Operand size = new Operand("Creature Size");
  Operand meleeHeavy = new Operand("Melee, heavy weapon", value: -2);
  Operand meleeLight = new Operand("Melee, light or finesse weapon", value: 2);
  Operand meleeTwoHanded = new Operand("Melee, two-handed weapon", value: -2);
  Operand rangedLoading = new Operand("Ranged, loading weapon", value: -5);
  Operand spellcasting = new Operand("Spellcasting");
  Operand other = new Operand("Other");

  CalculatedEntry initTotal = new CalculatedEntry("Initiative");

  InitiativeCalculator(Logger this._log, Database this._db) {
    _log.info("$runtimeType()");

    initTotal.addAll([
      initRoll,
      dexMod,
      meleeHeavy,
      meleeLight,
      meleeTwoHanded,
      rangedLoading,
      spellcasting,
      size,
      other
    ]);
  }

  void output() {
    _db.output("$initTotal");
  }
}
