// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';

class IceView extends ConsumerWidget {
  const IceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customizedModel = ref.watch(customizedProvider);
    final customizedData = customizedModel.customerList;
    final iceData = customizedData;

    return Text(iceData![0].iceCubes![0]);
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   width: MediaQuery.of(context).size.width,
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       crossAxisSpacing: 10,
    //       childAspectRatio: 10,
    //     ),
    //     itemCount: iceData!.length,
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //         onTap: () {},
    //         child: Container(
    //           width: 50,
    //           height: 25,
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10.0),
    //             color: Colors.grey[300],
    //           ),
    //           child: Text(
    //             iceData[index],
    //             style: const TextStyle(fontSize: 12.0),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
