// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/tea_model.dart';

class TeaViewModel extends StateNotifier<TeaList> {
  TeaViewModel() : super(TeaList(teaData: []));

  Future loadTeaData() async {
    try {
      final teaData = await rootBundle.loadString('assets/json/tea.json');
      final teaList = TeaList.fromJson(jsonDecode(teaData));
      state = teaList;
    } catch (error) {
      print('error');
    }
  }
}
