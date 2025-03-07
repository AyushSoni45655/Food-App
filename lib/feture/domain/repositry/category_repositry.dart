import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/domain/entity/category.dart';
import 'package:food_application/feture/domain/entity/categorydata.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryRepository{
  Future<Either<Failuress,List<Categoryss>>>getCategory();
  Future<Either<Failuress,List<CategoryData>>>getCategoryData(String categoryId);
}