import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String expression = '';
  String result = '0';

  void onButtonPressed(String value) {
    if (value == 'c') {
      clear();
    }else if (value == '=') {
      _calculateResult();
    } else {
      expression += value;
    }
  }

  void clear() {
    expression = '';
    result = '0';
  }

  void _calculateResult() {
    try {
      final finalExpression = expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('−', '-');

      final parser = Parser();
      final exp = parser.parse(finalExpression);
      final cm = ContextModel();

      final eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } catch (_) {
      result = 'Error';
    }
  }
}
