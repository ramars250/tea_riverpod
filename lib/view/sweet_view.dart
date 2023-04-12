// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';

class SweetView extends StatelessWidget {
  const SweetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selectedSweetIndex = ref.watch(selectedSweetProvider);
      final customizedModel = ref.watch(customizedProvider);
      final customizedData = customizedModel.customerList;
      if (customizedData != null && customizedData.isNotEmpty) {
        final sweetData = customizedData[1].sewwtness;
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
            itemCount: sweetData!.length,
            itemBuilder: (context, index) {
              final isSelected = selectedSweetIndex == index;
              return GestureDetector(
                onTap: () {
                  ref.read(selectedSweetProvider.notifier).selectedSweet(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isSelected ? Colors.green : Colors.grey[300],
                  ),
                  child: Text(
                    sweetData[index],
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
