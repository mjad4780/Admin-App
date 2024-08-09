import '../../../models/response_items/size.dart';

sendListApi(String input) {
  return input.replaceAll('[', '').replaceAll(']', '');
}

List<String> replacListIsEnpty(List<String> data) {
  return data.where((image) => image.isNotEmpty).toList();
}

List<ItemSize> replacMapsIsEnpty(List<ItemSize> data) {
  return data.where((item) => item.color == "").toList();
}

List<ItemSize> replacMaps2IsEnpty(List<ItemSize> data) {
  return data.where((item) => item.size == "").toList();
}
