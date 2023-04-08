// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/customized_model.dart';

class CustomizedViewModel extends StateNotifier<CustomizedData> {
  CustomizedViewModel() : super(CustomizedData(customerList: []));

  Future loadCustomizedData() async {
    try {
      final customizedData =
          await rootBundle.loadString('assets/json/customized.json');
      final customizedList = CustomizedData.fromJson(jsonDecode(customizedData));
      state = customizedList;
    } catch (error, st) {
      print(st);
    }
  }
}
