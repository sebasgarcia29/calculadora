import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString firstNumber = '10'.obs;
  RxString secondNumber = '20'.obs;
  RxString mathResult = '30'.obs;
  RxString operation = '+'.obs;

  void resetAll() {
    // firstNumber = '0'.obs;
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '';
  }

  addNumber(String number) {
    if (mathResult.value == '0') return mathResult.value = number;
    if (mathResult.value == '-0') return mathResult.value = '-$number';
    mathResult.value = mathResult.value + number;
  }

  changeNegativePositive() {
    if (mathResult.value.contains('-')) {
      mathResult.value = mathResult.value.replaceAll('-', '');
    } else {
      mathResult.value = '-${mathResult.value}';
    }
  }

  addDecimalPoint() {
    if (mathResult.value.contains('.')) {
      return;
    }
    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value = '${mathResult.value}.';
    }
  }

  selectedOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${num1 + num2}';
        break;
      case '-':
        mathResult.value = '${num1 - num2}';
        break;
      case '/':
        mathResult.value = '${num1 / num2}';
        break;
      case 'X':
        mathResult.value = '${num1 * num2}';
        break;
      default:
        return;
    }
    if (mathResult.value.endsWith('.0')) {
      mathResult.value = mathResult.value.replaceAll('.0', '');
    }
  }
}
