import 'package:angular2/core.dart';
import 'package:polymer/polymer.dart';

@Directive(selector: 'paper-checkbox[checked]')
class PaperCheckboxCheckedDirective {
  @Output() EventEmitter checkedChange = new EventEmitter();

  @HostListener('iron-change', const ['\$event'])
  void onChange(e) =>
      checkedChange.add(convertToDart(e).currentTarget.checked);
}