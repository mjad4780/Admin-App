class CategoryModel {
  String? sId;
  String? name;
  String? image;
  String? namear;

  CategoryModel({
    this.sId,
    this.name,
    this.image,
    this.namear,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    namear = json['namear'];
  }
}
