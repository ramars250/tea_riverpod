// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';


class IceView extends ConsumerWidget {
  const IceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIceIndex = ref.watch(selectedIceProvider);
    final customizedModel = ref.watch(customizedProvider);
    final customizedData = customizedModel.customerList;
    if (customizedData != null && customizedData.isNotEmpty) {
      final iceData = customizedData[0].iceCubes;
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
          itemCount: iceData!.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIceIndex == index;
            return GestureDetector(
              onTap: () {
                ref.read(selectedIceProvider.notifier).selectedIce(index);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: isSelected ? Colors.green : Colors.grey[300],
                ),
                child: Text(
                  iceData[index],
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
  }
}

// class IceView extends StatelessWidget {
//   const IceView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
//       final customizedModel = ref.watch(customizedProvider);
//       final customizedData = customizedModel.customerList;
//       final iceData = customizedData![0].iceCubes;
//       if (iceData != null) {
//         return Container(
//           alignment: Alignment.centerLeft,
//           width: MediaQuery.of(context).size.width,
//           child: GridView.builder(
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 10,
//               childAspectRatio: 10,
//             ),
//             itemCount: iceData.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 50,
//                   height: 25,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Colors.grey[300],
//                   ),
//                   child: const Text(
//                     'test',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//       const CircularProgressIndicator();
//     });
//   }
// }
