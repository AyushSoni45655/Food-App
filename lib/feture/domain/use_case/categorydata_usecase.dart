import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/domain/entity/categorydata.dart';
import 'package:food_application/feture/domain/repositry/category_repositry.dart';
import 'package:food_application/feture/domain/use_case/category_usecase.dart';
import 'package:fpdart/fpdart.dart';

class CategoryDataUseCase{
  final CategoryRepository categoryRepository;
  CategoryDataUseCase({required this.categoryRepository});
  Future<Either<Failuress,List<CategoryData>>>call(String categoryId)async{
    return await categoryRepository.getCategoryData(categoryId);
  }
}