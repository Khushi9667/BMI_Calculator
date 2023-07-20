import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;
  late double _bmi;
  CalculateBMI({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if ((_bmi >= 18.5) && (_bmi <= 24.9)) {
      return 'Normal';
    } else if ((_bmi >= 25.0) && (_bmi <= 29.9)) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String feedback() {
    if (_bmi < 18.5) {
      return "Oops! It looks like you're a little lighter than what's considered healthy. But don't worry, we've got your back! Time to add some extra fuel to your body's engine. Consider reaching out to a nutritionist or incorporating nutritious foods into your diet to help you achieve a healthy weight.";
    } else if ((_bmi >= 18.5) && (_bmi <= 24.9)) {
      return "Congratulations! You've hit the health jackpot. Your BMI falls within the normal range, indicating that you're maintaining a balanced weight. You're doing an excellent job taking care of yourself, so keep it up and revel in the rewards of a healthy lifestyle!";
    } else if ((_bmi >= 25.0) && (_bmi <= 29.9)) {
      return "Whoa, it seems like you're carrying some extra baggage on your health journey. But fret not, we're here to support you in shedding those pounds. Start by taking small steps towards a more active lifestyle and making mindful choices when it comes to your diet. You've got this, and we believe in you!";
    } else {
      return "Uh-oh, it looks like you've ventured into the heavyweight category. But don't let that discourage you! With determination and a game plan, you can turn things around. Start by seeking guidance from a healthcare professional who can assist you in developing a personalized approach to manage your weight. Remember, you're capable of incredible things, and we believe in your ability to make positive changes!";
    }
  }
}
