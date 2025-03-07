import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/data/model/categorydatamodal.dart';
import 'package:food_application/feture/data/model/categorymodal.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryDataSource{
  Future<List<CategoryModal>>getCategory();
  Future<List<CategoryDataModal>>getCategoryData(String categoryId);
}
class CategoryDataSouceImple extends CategoryDataSource{
  final FirebaseFirestore firebaseFirestore;
  CategoryDataSouceImple({required this.firebaseFirestore});
  @override
  Future<List<CategoryModal>>getCategory()async{
    final data = await firebaseFirestore.collection("FoodCategory").get();
   var datas =  data.docs.map((e) => CategoryModal.fromJson(e.data()),).toList();
   return datas;
  }

  @override
  Future<List<CategoryDataModal>> getCategoryData(String categoryId)async{
    final catData = await firebaseFirestore.collection("FoodCategory").doc(categoryId).collection("TacoDish").get();
    var datas = catData.docs.map((e) => CategoryDataModal.fromJson(e.data()),).toList();
    return datas;
  }
  
}