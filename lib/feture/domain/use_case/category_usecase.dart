import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/domain/entity/category.dart';
import 'package:food_application/feture/domain/repositry/category_repositry.dart';
import 'package:fpdart/fpdart.dart';

class CategoryUseCase{
  final CategoryRepository categoryRepository;
  CategoryUseCase({required this.categoryRepository});
  Future<Either<Failuress,List<Categoryss>>>call()async{
    return await categoryRepository.getCategory();
  }
}