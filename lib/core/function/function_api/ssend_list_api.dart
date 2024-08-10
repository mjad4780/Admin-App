import 'package:untitled/core/extensions/extention_navigator.dart';

import '../../../models/response_items/size.dart';

sendListApi(String input) {
  return input.replaceAll('[', '').replaceAll(']', '');
}

List<String> replacListIsEnpty(List<String> data) {
  List<String> datas = ['l', 'm'];
  if (data.isNullOrEmpty()) {
    return datas;
  } else {
    datas.clear();
    return datas = data.where((image) => image.isNotEmpty).toList();
  }
}

replacMapsColorIsEnpty(List<ItemSize> data) {
  List<ItemSize> datas = [];
  if (data.isNullOrEmpty()) {
    return datas;
  } else {
    return datas = data.where((item) => item.color!.isNotEmpty).toList();
  }
}

replacMapsSizeIsEnpty(List<ItemSize> data) {
  if (data.isNullOrEmpty()) {
    return [];
  } else {
    return data.where((item) => item.size!.isNotEmpty).toList();
  }
}
