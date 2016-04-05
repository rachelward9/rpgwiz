import 'dart:async';
import 'operand.dart';

class CalculatedEntry {
  final String name;
  num value;
  Map<Operand, StreamSubscription> operands = {};

  CalculatedEntry(this.name);

  void add(Operand op) {
    operands[op] = op.onChange.listen((_) => calculate());
    calculate();
  }

  void remove(Operand op) {
    if (operands.containsKey(op)) {
      operands[op].cancel();
      operands.remove(op);
      calculate();
    }
  }

  void calculate() {
    List<num> activeValues = operands.keys
        .where((Operand op) => op.active && op.value != null)
        .map((Operand op) => op.value);

    // calculate sum
    value = activeValues.isNotEmpty ? activeValues.reduce((num totalValue, num currentValue) => totalValue + currentValue) : null;
  }
}