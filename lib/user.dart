class User {
  int _height = 0;

  double _weight = 0;

  double _weightT = 0;
  double _value = 0;
  double _value2 = 0;
  double _value3 = 0;

  User(int height, double weight, double weightT, double value, double value2,
      double value3) {
    if (height <= 0 ||
        weight <= 0 ||
        weightT <= 0 ||
        value <= 0 ||
        value2 <= 0 ||
        value3 <= 0) {
      throw Exception('negative values not allowed');
    }

    _height = height;

    _weight = weight;
    _weightT = weightT;
    _value = value; // activity
    _value2 = value2; // gender
    _value3 = value3; //type
  }

  // got the math equation

  double calories() {
    double all = 0;
    if (_value2 == 1 && _value == 1 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.2;
    } else if (_value2 == 1 && _value == 2 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.55;
    } else if (_value2 == 1 && _value == 3 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.9;
    } else if (_value2 == 1 && _value == 1 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.2) - 500;
      //male        //not active       //type
    } else if (_value2 == 1 && _value == 1 && _value3 == 3) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.2) + 500;
    } else if (_value2 == 1 && _value == 2 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.55) - 700;
    } else if (_value2 == 1 && _value == 2 && _value3 == 3) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.55) + 700;
    } else if (_value2 == 1 && _value == 3 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.9) - 900;
    } else if (_value2 == 1 && _value == 3 && _value3 == 3) {
      all = (((10 * _weight + 6.25 * _height - 5 * _weightT + 5) * 1.9)) + 900;
    } else if (_value2 == 2 && _value == 1 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.2;
    } else if (_value2 == 2 && _value == 2 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.55;
    } else if (_value2 == 2 && _value == 3 && _value3 == 1) {
      all = (10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.9;
    } else if (_value2 == 2 && _value == 1 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.2) - 300;
      //male        //not active       //type
    } else if (_value2 == 2 && _value == 1 && _value3 == 3) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.2) + 300;
    } else if (_value2 == 2 && _value == 2 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.55) - 500;
    } else if (_value2 == 2 && _value == 2 && _value3 == 3) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT + 161) * 1.55) + 500;
    } else if (_value2 == 2 && _value == 3 && _value3 == 2) {
      all = ((10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.75) - 700;
    } else if (_value2 == 2 && _value == 3 && _value3 == 3) {
      all =
          (((10 * _weight + 6.25 * _height - 5 * _weightT - 161) * 1.75)) + 700;
    }
    if (all < 0) {
      all = 0;
    }
    return all;
  }

//activity: $_value

//gender: $_value2

//type: $_value3

// to string called it in result

  @override
  String toString() {
    return """
                 
${calories()}
""";
  }
}
