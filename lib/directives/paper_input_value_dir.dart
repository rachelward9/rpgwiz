import 'package:angular2/core.dart';
import 'package:polymer/polymer.dart';

@Directive(selector: 'paper-input[value]')
class PaperInputValueDirective {
  @Output() EventEmitter valueChange = new EventEmitter();

  @HostListener('input', const ['\$event'])
  void onChange(e) =>
      valueChange.add(convertToDart(e).currentTarget.value);
}