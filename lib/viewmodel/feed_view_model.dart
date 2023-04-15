// ignore_for_file: avoid_print
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/customized_model.dart';

class FeedViewModel extends StateNotifier<List<Feed>> {
  FeedViewModel() : super([]);

  void selectFeed(Feed feed) {
    if (state.length < 2 && !state.contains(feed)) {
      state = [...state, feed];
    }
  }

  void unselectFeed(Feed feed) {
    state = state.where((element) => element != feed).toList();
  }

  bool isFeedSelected(Feed feed) {
    return state.contains(feed);
  }

  void resetFeed() {
    state = [];
  }

  List<Feed> get selectedFeed {
    return state;
  }

  void toggleFeedSelected(Feed feed) {
    if (state.contains(feed)) {
      state = state.where((f) => f != feed).toList();
    } else if (state.length < 2) {
      state = [...state, feed];
    }
  }
}
