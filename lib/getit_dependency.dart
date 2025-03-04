import 'package:food_application/feture/presentation/blocs/nav/navigation_bloc.dart';
import 'package:food_application/feture/presentation/blocs/toggle/password_bloc.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;
Future<void>setUpLocator()async{
sl.registerFactory(() => NavigationBloc(),);
sl.registerFactory(() => PasswordBloc(),);
}