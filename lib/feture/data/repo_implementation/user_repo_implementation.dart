import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/src/either.dart';

import '../../../core/failure.dart';
import '../../domain/entity/user.dart';
import '../data_source/user_data_source.dart';

class UserRepoImplementation extends UserRepositry{
  final UserDataSource userDataSource;
  UserRepoImplementation({required this.userDataSource});
  @override
  Future<Either<Failuress, bool>> isUserLoggedIn()async{
    try{
      final isloggedin = await userDataSource.isUserLoggedIn();
      return Right(isloggedin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>> logOut() async{
    try{
      final logout = await userDataSource.logout();
      return Right(logout);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> login(String email, String password) async{
    try {
      final login = await userDataSource.login(email, password);
      return Right(login);
    } catch (e) {
      return  Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, UserEntity>> signIn(UserEntity users)async{
    try{
      final signin = await userDataSource.signup(users);
      return Right(signin);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failuress, void>>forgotPassword(String email)async{
    try{
      final fPassword = await userDataSource.forgotPassword(email);
      return Right(fPassword);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}
