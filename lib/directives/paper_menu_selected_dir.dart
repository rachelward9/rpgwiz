import 'package:angular2/core.dart';
import 'package:polymer/polymer.dart';

@Directive(selector: 'paper-menu[selected]')
class PaperMenuSelectedDirective {
  @Output() EventEmitter selectedChange = new EventEmitter();

  @HostListener('iron-select', const ['\$event'])
  void onChange(e) {
    print("${convertToDart(e).currentTarget.selected}");
  }
//      selectedChange.add(convertToDart(e).currentTarget.selected);
}