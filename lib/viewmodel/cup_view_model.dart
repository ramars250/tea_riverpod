import 'package:flutter_riverpod/flutter_riverpod.dart';

class CupViewModel extends StateNotifier<int> {
  CupViewModel() : super(0);

  void selectCup(int index) {
    state = index;
  }

  void resetCup() {
    state = 0;
  }
}