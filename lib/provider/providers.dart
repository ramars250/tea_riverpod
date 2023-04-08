// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/customized_model.dart';
import 'package:tea_riverpod/model/tea_model.dart';
import 'package:tea_riverpod/viewmodel/customized_view_model.dart';
import 'package:tea_riverpod/viewmodel/tea_view_model.dart';

//監看TeaViewModel並使用裡面的loadTeaData來載入Tea的資料
final teaViewModelProvider =
    StateNotifierProvider<TeaViewModel, TeaList>((ref) {
  final teaViewModel = TeaViewModel();
  teaViewModel.loadTeaData();
  return teaViewModel;
});

//監看Items用來記錄選中的項目
final selectedTeaProvider = StateProvider<Items?>((ref) => null);

final customizedProvider =
    StateNotifierProvider<CustomizedViewModel, CustomizedData>((ref) {
  final customizedModel = CustomizedViewModel();
  customizedModel.loadCustomizedData();
  return customizedModel;
});
// final teaServiceProvider = StateNotifierProvider<TeaService, TeaList>((ref) {
//   final teaService = TeaService();
//   teaService.loadTeaData();
//   return teaService;
// });

// final teaJsonProvider = FutureProvider<Map<String, dynamic>>((ref) async {
//   final jsonString = await rootBundle.loadString('assets/json/tea.json');
//   return jsonDecode(jsonString);
// });
