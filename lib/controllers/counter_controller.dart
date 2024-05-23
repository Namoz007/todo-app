import 'package:dars_18/models/counter.dart';

class CounterControlers {
  Counter counter = Counter(0);
  int get value {
    return counter.value;
  }

  void increment() {
    counter.value++;
  }

  void decrament() {
    counter.value--;
  }
}