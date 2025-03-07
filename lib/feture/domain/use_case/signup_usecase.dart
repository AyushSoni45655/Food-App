import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';
import '../entity/user.dart';

class SignInUseCase{
  final UserRepositry userRepository;
  SignInUseCase({required this.userRepository});
  Future<Either<Failuress,UserEntity>>call(UserEntity users)async{
    return await userRepository.signIn(users);
  }
}