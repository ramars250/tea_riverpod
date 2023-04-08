import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';

class CupView extends ConsumerWidget {
  const CupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cupData = ref.watch(selectedTeaProvider);
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 2.5,
      ),
      itemCount: cupData?.size!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
            child: Text(
              cupData!.size![index],
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
