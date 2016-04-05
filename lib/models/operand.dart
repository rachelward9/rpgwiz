import 'dart:async';

class Operand {
  final String name;
  String notes;
  num _value;
  bool _active;

  String _inputValue;   // best to bind here from UI controls

  StreamController _onChange = new StreamController.broadcast();

  Operand(this.name, {value, active: false}) : _value = value, _active = active;

  num get value => _value;
  void set value(num data) {
    _value = data;
    _onChange.add(null);
  }

  bool get active => _active;
  void set active(bool data) {
    _active = data;
    _onChange.add(null);
  }

  String get inputValue => _inputValue;
  void set inputValue(String data) {
    _inputValue = data;
    value = num.parse(data.replaceAll("+", ""), (_) => null);
  }

  Stream get onChange => _onChange.stream;

  @override String toString() => "$name${notes != null ? ' ($notes)': ''}: $_value";
}