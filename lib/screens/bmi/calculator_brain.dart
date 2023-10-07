import 'dart:math';


class Calculator_brain {
  Calculator_brain(this.height, this.weight);

  late int height;
  late int weight;
  double? _bmi;

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getresults() {
    if (_bmi! >= 25) {
      return 'اضافه وزن';
    } else if (_bmi! > 18.5) {
      return 'وزن نرمال';
    } else {
      return 'کم وزنی';
    }
  }

  String getinterpretation(){
    if (_bmi! >= 25) {
      return 'وزن شما بیش از مقدار استاندارد می باشد .';
    } else if (_bmi! > 18.5) {
      return 'تبریک ! شما وزن مناسبی دارید .';
    } else {
      return 'وزن شما کمتر از میزان استاندارد می باشد .';
    }
  }
}
