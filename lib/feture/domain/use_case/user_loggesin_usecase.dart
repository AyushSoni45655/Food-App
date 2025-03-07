import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';

class UserLoggedInUseCase{
  final UserRepositry userRepository;
  UserLoggedInUseCase({required this.userRepository});
  Future<Either<Failuress,bool>>call()async{
    return await userRepository.isUserLoggedIn();
  }
}