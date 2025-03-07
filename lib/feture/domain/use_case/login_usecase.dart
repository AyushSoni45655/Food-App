import 'package:food_application/core/failure.dart';
import 'package:food_application/feture/domain/entity/user.dart';
import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCae{
  final UserRepositry userRepositry;
  LoginUseCae({required this.userRepositry});
  Future<Either<Failuress,UserEntity>>call(String email,String password)async{
    return await userRepositry.login(email, password);
  }
}