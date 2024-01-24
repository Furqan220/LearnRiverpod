import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'navigation_notifier.g.dart';

@riverpod 
class NavigationNotifier<int> extends _$NavigationNotifier {
  @override
  build()=>0;

  void setNavigation(int i) => state = i;

}