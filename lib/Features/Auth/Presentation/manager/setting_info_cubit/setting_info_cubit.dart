import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_info_state.dart';

class SettingInfoCubit extends Cubit<SettingInfoState> {
  SettingInfoCubit() : super(SettingInfoInitial());
}
