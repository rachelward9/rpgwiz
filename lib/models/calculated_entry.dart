import 'dart:async';
import 'operand.dart';

class CalculatedEntry {
  final String name;
  final Map<Operand, StreamSubscription> operands = {};
  num value;

  CalculatedEntry(this.name);

  void add(Operand op, {bool recalculate: true}) {
    operands[op] = op.onChange.listen((_) => calculate());

    if (recalculate) {
      calculate();
    }
  }

  void addAll(List<Operand> list) {
    for (Operand op in list) {
      add(op, recalculate: false);
    }

    calculate();
  }

  void remove(Operand op, {bool recalculate: true}) {
    if (operands.containsKey(op)) {
      operands[op].cancel();
      operands.remove(op);

      if (recalculate) {
        calculate();
      }
    }
  }

  void clear() {
    operands.forEach((Operand op, StreamSubscription sub) => remove(op, recalculate: false));
    calculate();
  }

  void calculate() {
    List<num> activeValues = operands.keys
        .where((Operand op) => op.active && op.value != null)
        .map((Operand op) => op.value)
        .toList();

    // calculate sum
    value = activeValues.isNotEmpty ? activeValues.reduce((num totalValue, num currentValue) => totalValue + currentValue) : null;
  }
}