import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/data/hive_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(HiveHelper.theme ? ThemeMode.dark : ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
