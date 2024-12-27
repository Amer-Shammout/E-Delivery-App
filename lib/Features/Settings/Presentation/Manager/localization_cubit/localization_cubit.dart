import 'package:hydrated_bloc/hydrated_bloc.dart';



class LocalizationCubit extends HydratedCubit<String> {
  LocalizationCubit()
      : super('System');

  void updateLanguage(String language) => emit(language);

  @override
  String? fromJson(Map<String, dynamic> json) => json['value'] as String;

  @override
  Map<String, String>? toJson(String state) => {'value': state};
}
