import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_application/feture/data/data_source/category_datasource.dart';
import 'package:food_application/feture/data/repo_implementation/categoryrepoImple.dart';
import 'package:food_application/feture/domain/repositry/category_repositry.dart';
import 'package:food_application/feture/domain/repositry/user_repositry.dart';
import 'package:food_application/feture/domain/use_case/category_usecase.dart';
import 'package:food_application/feture/domain/use_case/categorydata_usecase.dart';
import 'package:food_application/feture/domain/use_case/login_usecase.dart';
import 'package:food_application/feture/presentation/blocs/firedata/firebasedata_bloc.dart';
import 'package:food_application/feture/presentation/blocs/nav/navigation_bloc.dart';
import 'package:food_application/feture/presentation/blocs/toggle/password_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feture/data/data_source/user_data_source.dart';
import 'feture/data/repo_implementation/user_repo_implementation.dart';
import 'feture/domain/use_case/forgotpassword_usecase.dart';
import 'feture/domain/use_case/logout_usecase.dart';
import 'feture/domain/use_case/signup_usecase.dart';
import 'feture/domain/use_case/user_loggesin_usecase.dart';
import 'feture/presentation/blocs/auth/authentication_bloc.dart';
final sl = GetIt.instance;
Future<void>setUpLocator()async{
sl.registerFactory(() => NavigationBloc(),);
sl.registerFactory(() => PasswordBloc(),);
                                                                  // for authentication dependencies
sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance,);
sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance,);
final sharedPreferences = await SharedPreferences.getInstance();
sl.registerLazySingleton<SharedPreferences>(() =>sharedPreferences ,);
sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImplement(sharedPreferences: sl(), firestore:sl(), auth: sl()),);
sl.registerLazySingleton<UserRepositry>(() => UserRepoImplementation(userDataSource: sl()),);
sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(userRepository: sl()),);
sl.registerLazySingleton<LoginUseCae>(() => LoginUseCae(userRepositry: sl()),);
sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(userRepository: sl()),);
sl.registerLazySingleton<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(userRepository: sl()),);
sl.registerLazySingleton<UserLoggedInUseCase>(() => UserLoggedInUseCase(userRepository: sl()),);
sl.registerFactory(() => AuthenticationBloc(forgotPasswordUseCase: sl(),loggedInUseCase: sl(),loginUseCase: sl(),logOutUseCase: sl(),signInUseCase: sl()),);

                                                  //category fetch in firebase firestore

  sl.registerLazySingleton<CategoryDataSource>(() => CategoryDataSouceImple(firebaseFirestore: sl()),);
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepoImple(categoryDataSource: sl()),);
  sl.registerLazySingleton<CategoryUseCase>(() => CategoryUseCase(categoryRepository: sl()),);
  sl.registerLazySingleton<CategoryDataUseCase>(() => CategoryDataUseCase(categoryRepository: sl()),);
  sl.registerFactory(() => FirebaseDataBloc(categoryUseCase: sl(),categoryDataUseCase: sl()),);
}