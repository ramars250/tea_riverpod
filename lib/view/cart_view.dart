import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/provider/providers.dart';
import 'package:tea_riverpod/view/common.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  route() => MaterialPageRoute(builder: (context) => const CartView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final cartData = ref.watch(cartProvider);
        return Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  final cartItem = cartData[index];
                  return ListTile(
                    leading: Text(cartItem.teaTitle),
                    title: Text(cartItem.cupType +
                        cartItem.iceLevel +
                        cartItem.sweetLevel),
                    trailing: Text('${cartItem.feeds}'),
                  );
                }),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TeaView()));
              },
              child: const Text('首頁'),
            ),
          ],
        );
      }),
    );
  }
}
