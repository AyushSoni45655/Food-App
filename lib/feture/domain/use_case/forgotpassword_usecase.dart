import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';

class ForgotPasswordUseCase{
  final UserRepositry userRepository;
  ForgotPasswordUseCase({required this.userRepository});
  Future<Either<Failuress,void>>call(String email)async{
    return await userRepository.forgotPassword(email);
  }
}