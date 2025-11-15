import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_categories/response_categories.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;

  ///:view
  const factory CategoriesState.loadingview() = Loadingview;
  const factory CategoriesState.successview(
      ResponseCategories responseCategories) = Successview;
  const factory CategoriesState.erorrview({required String erorr}) = Erorrview;

  ///:add
  const factory CategoriesState.loadingAdd() = LoadingAdd;
  const factory CategoriesState.successAdd() = SuccessAdd;
  const factory CategoriesState.erorrAdd({required String erorr}) = ErorrAdd;

  ///:edit
  const factory CategoriesState.loadingedit() = Loadingedit;
  const factory CategoriesState.successedit() = Successedit;
  const factory CategoriesState.erorredit({required String erorr}) = Erorredit;

  ///:delete
  const factory CategoriesState.loadingdelete() = Loadingdelete;
  const factory CategoriesState.successdelete() = Successdelete;
  const factory CategoriesState.erorrdelete({required String erorr}) =
      Erorrdelete;

  ///: galer
  const factory CategoriesState.galer() = Galer;

  ///: PushEdit
  const factory CategoriesState.PushEdit() = PushEdit;
}
