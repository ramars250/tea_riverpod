// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';
import 'package:tea_riverpod/view/order_view.dart';

class TeaView extends StatelessWidget {
  const TeaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final teaList = ref.watch(teaViewModelProvider);
            return teaList.when(
                data: (data) => ListView.builder(
                      itemCount: data.teaData?.length ?? 0,
                      itemBuilder: (context, index) {
                        final tea = data.teaData![index];
                        return ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.end,
                          maintainState: true,
                          title: Text(tea.kindTitle ?? 'unknown'),
                          children: [
                            if (tea.items != null)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: tea.items!.length,
                                itemBuilder: (context, index) {
                                  final item = tea.items![index];
                                  return ListTile(
                                    leading: Text(item.itemTitle ?? 'unknown'),
                                    title: Text('冰:${item.coldPrice}'),
                                    trailing: item.hotPrice != null
                                        ? Text('熱:${item.hotPrice}')
                                        : null,
                                    textColor: Colors.black,
                                    onTap: () {
                                      ref
                                          .read(selectedTeaProvider.notifier)
                                          .state = tea.items![index];
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const OrderView());
                                    },
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    ),
                error: (error, stackTrace) =>
                    const Text('Error loading tea data'),
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          },
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home),
      //     label: '首頁'),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
      //     label: '購物車'),
      //   ],
      //
      // ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(body: Center(
//     child: Consumer(
//       builder: (context, ref, child) {
//         final teaModel = ref.watch(teaViewModelProvider);
//         final teaList = teaModel.teaData;
//         return teaList != null
//             ? ListView.builder(
//                 itemCount: teaList.length,
//                 itemBuilder: (context, index) {
//                   final kindTitle = teaList[index].kindTitle;
//                   final items = teaList[index].items;
//                   return ExpansionTile(
//                     expandedCrossAxisAlignment: CrossAxisAlignment.end,
//                     maintainState: true,
//                     title: Text(kindTitle!),
//                     children: [
//                       items != null
//                           ? ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: items.length,
//                               itemBuilder: (context, index) {
//                                 final item = items[index];
//                                 return ListTile(
//                                   leading: Text(item.itemTitle!),
//                                   title: Text('冰:${item.coldPrice}'),
//                                   // subtitle: Text('價格: ${item.coldPrice}元'),
//                                   trailing: item.hotPrice != null
//                                       ? Text('熱:${item.hotPrice}')
//                                       : null,
//                                   textColor: Colors.black,
//                                   onTap: () {
//                                     ref.read(selectedTeaProvider.notifier).state = items[index];
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) => OrderView());
//                                   },
//                                 );
//                               },
//                             )
//                           : const CircularProgressIndicator(),
//                     ],
//                   );
//                 })
//             : const CircularProgressIndicator();
//       },
//     ),
//   ));
// }
}
