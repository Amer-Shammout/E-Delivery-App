part of 'setting_info_cubit.dart';

sealed class SettingInfoState extends Equatable {
  const SettingInfoState();

  @override
  List<Object> get props => [];
}

final class SettingInfoInitial extends SettingInfoState {}

final class SettingInfoLoading extends SettingInfoState {}

final class SettingInfoSuccess extends SettingInfoState {
  final User user;

  const SettingInfoSuccess({required this.user});
}

final class SettingInfoFailure extends SettingInfoState {
  final String errMessage;

  const SettingInfoFailure({required this.errMessage});
}
