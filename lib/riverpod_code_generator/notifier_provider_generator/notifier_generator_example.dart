import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier_generator_example.g.dart';
@riverpod
class CounterNotifierGenerator extends _$CounterNotifierGenerator {
  
  void increment()
  {
    state++;
  }

  void decrement()
  {
    state--;
  }
  void reset()
  {
    state = 0;
  }
  
  @override
  int build() {
    return 0;
  }
}