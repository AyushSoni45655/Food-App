
import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';

class LogOutUseCase{
  final UserRepositry userRepository;
  LogOutUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call()async{
    return await userRepository.logOut();
  }
}