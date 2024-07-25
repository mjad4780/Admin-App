part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class SetDataForUpdateCategory extends CategoryState {}

final class ClearFields extends CategoryState {}
