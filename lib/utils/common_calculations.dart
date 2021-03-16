import 'dart:math';

class ShitabsCalculator {
  static getRandomNumber(int upperLimit, int lowerLimit) {
    final random = new Random();
    return lowerLimit + random.nextInt(upperLimit - lowerLimit);
  }

  static T getRandomElementFromList<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  static bool isDivisible(int n, int div) {
    return n % div == 0;
  }

}