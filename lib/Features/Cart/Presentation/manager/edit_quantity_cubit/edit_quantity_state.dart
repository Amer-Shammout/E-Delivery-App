part of 'edit_quantity_cubit.dart';

sealed class EditQuantityState extends Equatable {
  const EditQuantityState();

  @override
  List<Object> get props => [];
}

final class EditQuantityInitial extends EditQuantityState {}

final class EditQuantityIncrementEnabled extends EditQuantityState {}

final class EditQuantityIncrementDisabled extends EditQuantityState {}

final class EditQuantityDecrementEnabled extends EditQuantityState {}

final class EditQuantityDecrementDisabled extends EditQuantityState {}
