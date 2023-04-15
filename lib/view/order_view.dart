// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/cart_model.dart';
import 'package:tea_riverpod/provider/providers.dart';
import 'package:tea_riverpod/view/cup_view.dart';
import 'package:tea_riverpod/view/feed_view.dart';
import 'package:tea_riverpod/view/ice_view.dart';
import 'package:tea_riverpod/view/sweet_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final textController = TextEditingController();
  int amount = 1;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final teaSelected = ref.watch(selectedTeaProvider);
      final teaList = ref.watch(teaViewModelProvider);
      final cupData = ref.watch(selectedCupProvider.select((value) => value));
      final customizedModel = ref.watch(customizedProvider);
      final iceData = ref.watch(selectedIceProvider.select((value) => value));
      final sweetData =
          ref.watch(selectedSweetProvider.select((value) => value));
      final feedData = ref.watch(selectedFeedProvider.select((value) => value));
      return teaList.when(
          data: (data) => Dialog(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                teaSelected?.itemTitle ?? '',
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.redAccent[100]),
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const Text('訂購人姓名(非必填)'),
                        ),
                        TextField(
                          controller: textController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          autofocus: false,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              isCollapsed: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              hintText: '非商品備註，僅提供填寫訂購人資訊'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '杯型',
                          style: TextStyle(fontSize: 16),
                        ),
                        const CupView(),
                        const Text(
                          '冰塊',
                          style: TextStyle(fontSize: 16),
                        ),
                        const IceView(),
                        const Text(
                          '甜度',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SweetView(),
                        const Text(
                          '配料',
                          style: TextStyle(fontSize: 16),
                        ),
                        const FeedView(),
                        const SizedBox(height: 10.0),
                        const Divider(
                          height: 1.5,
                          color: Colors.grey,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              right: 0, left: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      '總金額元'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            amount--;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(amount.toString()),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            amount++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.lightBlue[300],
                          ),
                          child: TextButton(
                            child: const Text(
                              '訂購',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              ref.read(selectedCupProvider.notifier).resetCup();
                              ref.read(selectedIceProvider.notifier).resetIce();
                              ref
                                  .read(selectedSweetProvider.notifier)
                                  .resetSweet();
                              ref
                                  .read(selectedFeedProvider.notifier)
                                  .resetFeed();
                              final order = CartModel(
                                teaTitle: teaSelected!.itemTitle ?? '',
                                cupType: teaSelected.size![cupData],
                                iceLevel: customizedModel
                                    .customerList![0].iceCubes![iceData],
                                sweetLevel: customizedModel
                                    .customerList![1].sewwtness![sweetData],
                                feeds: feedData
                                    .map((e) => e.title)
                                    .whereType<String>()
                                    .toList(),
                                customerName: textController.text,
                                totalPrice: ref.watch(totalPriceProvider),
                                // cupData != 0
                                //     ? (teaSelected.coldPrice! +
                                //         20 +
                                //         (feedData.map((e) => e.price).first)! +
                                //         (feedData.map((e) => e.price).last)!)
                                //     : teaSelected.coldPrice!,
                              );
                              print(order.totalPrice);
                              // print(feedData.map((e) => e.price).last);
                              print(ref.read(totalPriceProvider));
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          error: (error, stackTrace) => const Text('Error loading tea data'),
          loading: () => const Center(child: CircularProgressIndicator()));
    });
  }
}

// class OrderView extends ConsumerWidget {
//   OrderView({super.key});
//
//   route() => MaterialPageRoute(builder: (context) => OrderView());
//
//   final textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final teaSelected = ref.watch(selectedTeaProvider);
//     final teaModel = ref.watch(teaViewModelProvider);
//     final teaList = teaModel.teaData;
//     return teaList != null
//         ? Dialog(
//             child: Container(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               height: MediaQuery.of(context).size.height,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             '${teaSelected!.itemTitle}',
//                             style: const TextStyle(fontSize: 25),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(1000),
//                               color: Colors.redAccent[100]),
//                           child: IconButton(
//                             icon: const Icon(Icons.close),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       padding: const EdgeInsets.only(bottom: 10.0),
//                       child: const Text('訂購人姓名(非必填'),
//                     ),
//                     TextField(
//                       controller: textController,
//                       textAlign: TextAlign.start,
//                       textAlignVertical: TextAlignVertical.center,
//                       autofocus: false,
//                       decoration: InputDecoration(
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 10),
//                           isCollapsed: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(2),
//                             borderSide: const BorderSide(
//                               color: Colors.black,
//                               width: 2.0,
//                             ),
//                           ),
//                           hintText: '非商品備註，僅提供填寫訂購人資訊'),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       '杯型',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const CupView(),
//                     const Text(
//                       '冰塊',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const IceView(),
//                     const Text(
//                       '甜度',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SweetView(),
//                     const Text(
//                       '配料',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const FeedView(),
//                     const SizedBox(height: 10.0),
//                     const Divider(
//                       height: 1.5,
//                       color: Colors.grey,
//                     ),
//                     Container(
//                       padding:
//                           const EdgeInsets.only(right: 0, left: 0, bottom: 0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 const Text('總金額元'),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.remove,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.all(8.0),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey),
//                                       ),
//                                       child: const Text('test'),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.green,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 5.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Colors.lightBlue[300],
//                       ),
//                       child: TextButton(
//                         child: const Text(
//                           '訂購',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         : const CircularProgressIndicator();
//   }
// }
