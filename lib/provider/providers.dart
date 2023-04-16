// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/cart_model.dart';
import 'package:tea_riverpod/model/customized_model.dart';
import 'package:tea_riverpod/model/tea_model.dart';
import 'package:tea_riverpod/viewmodel/common.dart';

//監看TeaViewModel並使用裡面的loadTeaData來載入Tea的資料
final teaViewModelProvider = FutureProvider<TeaList>((ref) async {
  final teaData = await rootBundle.loadString('assets/json/tea.json');
  final teaList = TeaList.fromJson(jsonDecode(teaData));
  return teaList;
});

//監看Items用來記錄選中的項目
final selectedTeaProvider = StateProvider<Items?>((ref) => null);

final customizedProvider =
    StateNotifierProvider<CustomizedViewModel, CustomizedData>((ref) {
  final customizedModel = CustomizedViewModel();
  customizedModel.loadCustomizedData();
  return customizedModel;
});

//監看選中的cupSize
final selectedCupProvider =
    StateNotifierProvider<CupViewModel, int>((ref) => CupViewModel());

final selectedIceProvider =
    StateNotifierProvider<IceViewModel, int>((ref) => IceViewModel());

final selectedSweetProvider =
    StateNotifierProvider<SweetViewModel, int>((ref) => SweetViewModel());

final selectedFeedProvider =
    StateNotifierProvider<FeedViewModel, List<Feed>>((ref) => FeedViewModel());

//訂單資料的provider
final cartProvider = StateNotifierProvider<OrderViewModel, List<CartModel>>((ref) => OrderViewModel());

//單筆訂單的總金額
final totalPriceProvider = StateProvider<int>((ref) {
  final order = ref.watch(selectedTeaProvider);
  int totalPrice = 0;
  final selectedCup = ref.watch(selectedCupProvider.select((value) => value));
  final cupPrice = selectedCup == 1 ? order!.coldPrice! + 20 : order!.coldPrice;
  final selectedFeed = ref.watch(selectedFeedProvider.select((value) => value));
  final feedPrice = selectedFeed.length == 2
      ? selectedFeed
          .map((e) => e.price)
          .reduce((value1, value2) => value1! + value2!)
      : selectedFeed.isNotEmpty
          ? selectedFeed.first.price
          : 0;
  totalPrice = cupPrice! + feedPrice!;
  return totalPrice;
});

