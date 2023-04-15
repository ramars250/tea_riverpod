// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selectedFeed = ref.watch(selectedFeedProvider);
      final customizedModel = ref.watch(customizedProvider);
      final customizedData = customizedModel.customerList;
      if (customizedData != null && customizedData.isNotEmpty) {
        final feedData = customizedData[2].feed;
        return Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio: 3.5,
            ),
            itemCount: feedData!.length,
            itemBuilder: (context, index) {
              final feed = feedData[index];
              final isSelected = selectedFeed.contains(feed);
              return GestureDetector(
                onTap: () {
                  ref.read(selectedFeedProvider.notifier).toggleFeedSelected(feed);
                  // if (isSelected) {
                  //   ref.read(selectedFeedProvider.notifier).unselectFeed(feed);
                  // } else {
                  //   ref.read(selectedFeedProvider.notifier).selectFeed(feed);
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isSelected ? Colors.green : Colors.grey[300],
                  ),
                  child: Text(
                    '${feed.title}',
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
