import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';

class CupView extends ConsumerWidget {
  const CupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cupSelected = ref.watch(selectedTeaProvider);
    final cupData = ref.watch(selectedTeaProvider);
    final selectedCupIndex = ref.watch(selectedCupProvider);
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 3.5,
      ),
      itemCount: cupData?.size!.length,
      itemBuilder: (context, index) {
        final isSelected = selectedCupIndex == index;
        return GestureDetector(
          onTap: () {
            ref.read(selectedCupProvider.notifier).selectCup(index);
            // ref.read(selectedCupProvider.notifier).resetCup();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? Colors.green : Colors.grey[300]),
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
