import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/data/data_source/category_datasource.dart';
import 'package:food_application/feture/domain/entity/category.dart';
import 'package:food_application/feture/domain/entity/categorydata.dart';
import 'package:food_application/feture/domain/repositry/category_repositry.dart';
import 'package:fpdart/src/either.dart';

class CategoryRepoImple extends CategoryRepository{
  final CategoryDataSource categoryDataSource;
  CategoryRepoImple({required this.categoryDataSource});
  @override
  Future<Either<Failuress, List<Categoryss>>> getCategory() async{
    try{
      final data =await  categoryDataSource.getCategory();
      return Right(data);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, List<CategoryData>>> getCategoryData(String categoryId)async{
    try{
      final datass = await categoryDataSource.getCategoryData(categoryId);
      return Right(datass);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}