import 'package:flutter_riverpod/flutter_riverpod.dart';

class SweetViewModel extends StateNotifier<int> {
  SweetViewModel() : super(-1);

  void selectedSweet(int index) {
    state = index;
  }

  void resetSweet() {
    state = -1;
  }
}
