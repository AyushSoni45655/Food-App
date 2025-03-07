import 'package:flutter/foundation.dart';
import 'package:food_application/feture/domain/entity/category.dart';

class CategoryModal extends Categoryss{
  CategoryModal({required String id,required String name,required String image}):super(
    id: id,
    name: name,
    image: image
  );
  factory CategoryModal.fromJson(Map<String,dynamic>tojson){
    return CategoryModal(
        id: tojson["Id"]??"",
        name: tojson["Name"]??"",
        image: tojson["Image"]??""
    );
  }
}