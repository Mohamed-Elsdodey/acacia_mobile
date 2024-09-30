part of 'childern_cubit.dart';

sealed class ChildernState extends Equatable {
  const ChildernState();
  @override
  List<Object> get props => [];
}

final class ChildernInitial extends ChildernState {}

final class ChildernLoading extends ChildernState {}

final class ChildernFailure extends ChildernState {
  final String errorMassage;

  const ChildernFailure(this.errorMassage);
}

final class ChildernSuccess extends ChildernState {
  final ChildernModel childernModel;

  const ChildernSuccess(this.childernModel);
}
