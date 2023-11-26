class User {
  int _height = 0;

  double _weight = 0;

  double _weightT = 0;
  double _value = 0;

  User(int height, double weight, double weightT, double value) {
    if (height <= 0 || weight <= 0 || weightT <= 0 || value <= 0) {
      throw Exception('negative values not allowed');
    }

    _height = height;

    _weight = weight;
    _weightT = weightT;
    _value = value;
  }

  double netSalary() {
    return (_height * _weight);
  }

  @override
  String toString() {
    return """

Height: $_height

Weight: $_weight

Targeted Weight: $_weightT

valu: $_value

Net Salary: ${netSalary()} """;
  }
}
