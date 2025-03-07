import 'package:food_application/feture/domain/entity/categorydata.dart';

class CategoryDataModal extends CategoryData {
  CategoryDataModal({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
  });
  factory CategoryDataModal.fromJson(Map<String,dynamic>json){
    return CategoryDataModal(
        id: json['Id']??'',
        name: json['Name']??'',
        description: json['Des']??'',
        image: json['Image']??'',
        price: json['Price']??'',
    );
  }
}
