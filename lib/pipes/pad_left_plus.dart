import 'package:angular2/core.dart';

@Pipe(name: 'padLeftPlus')
class PadLeftPlus implements PipeTransform {
  @override String transform(val, List args) =>
      val != null ? val.toString().padLeft(2, "+") : "";
}