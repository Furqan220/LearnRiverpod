import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterNotifier extends Notifier<int> {
  

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

final counterNotifierProvider = NotifierProvider<CounterNotifier,int>(() => CounterNotifier(),);

