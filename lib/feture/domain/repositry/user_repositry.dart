import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';
import '../entity/user.dart';

abstract class UserRepositry{
  Future<Either<Failuress,UserEntity>>signIn(UserEntity users);
  Future<Either<Failuress,UserEntity>>login(String email,String password);
  Future<Either<Failuress,void>>logOut();
  Future<Either<Failuress,bool>>isUserLoggedIn();
  Future<Either<Failuress,void>>forgotPassword(String email);
}