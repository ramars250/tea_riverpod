import 'package:flutter_riverpod/flutter_riverpod.dart';

class IceViewModel extends StateNotifier<int> {
  IceViewModel() : super(-1);

  void selectedIce(int index) {
    state = index;
  }

  void resetIce() {
    state = -1;
  }
}
