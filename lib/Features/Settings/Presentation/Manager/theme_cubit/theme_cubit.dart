import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) =>
      ThemeMode.values[json['value'] as int];

  @override
  Map<String, int>? toJson(ThemeMode state) => {'value': state.index};
}
